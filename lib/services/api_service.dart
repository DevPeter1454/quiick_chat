import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:quiick_chat/app/app.locator.dart';
import 'package:quiick_chat/app/app.logger.dart';
import 'package:quiick_chat/app/app.router.dart' show Routes;
import 'package:quiick_chat/models/export.dart';
import 'package:quiick_chat/services/local_storage_service.dart';
import 'package:quiick_chat/shared/export.dart';
import 'package:stacked_services/stacked_services.dart' show NavigationService;

class ApiService {
  // Logger for this service
  final logger = getLogger('ApiService');
  final _localStorageService = locator<LocalStorageService>();
  final _navigationService = locator<NavigationService>();

  // Dio instance
  late final Dio _dio;

  // Base URL for API
  final String baseUrl = ApiUrls.baseUrl;

  // Token for authorization
  String? _authToken;

  // Getter and setter for auth token
  String? get authToken => _authToken;
  set authToken(String? token) {
    _authToken = token;
    _updateAuthHeader();
  }

  // Constructor
  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Add interceptors for logging, auth tokens, etc.
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          logger.i('REQUEST[${options.method}] => PATH: ${options.path}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          logger.i(
              'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          logger.e(
              'ERROR[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}');
          return handler.next(e);
        },
      ),
    );

    // Load token from local storage if available
    _loadSavedToken();
  }

  // Load token from local storage
  void _loadSavedToken() {
    final savedToken = _localStorageService.getAccessToken();
    if (savedToken != null && savedToken.isNotEmpty) {
      authToken = savedToken;
      logger.i('Token loaded from local storage');
    }
  }

  // Update authorization header when token changes
  void _updateAuthHeader() {
    if (_authToken != null && _authToken!.isNotEmpty) {
      _dio.options.headers['Authorization'] = 'Bearer $_authToken';
      logger.i('Authorization header updated with token');
    } else {
      _dio.options.headers.remove('Authorization');
      logger.i('Authorization header removed');
    }
  }

  // Method to set token from login response
  void setTokenFromResponse(Result<dynamic> result) {
    if (result.isSuccess && result.token != null) {
      authToken = result.token;
      _localStorageService.saveAccessToken(result.token!);
      _localStorageService.saveRefreshToken(result.refreshToken!);
      final user = User.fromJson(result.getNestedField(['data', 'user']));
      _localStorageService.saveUser(user);

      logger.i('Token set from response $user');
    }
  }

  void setOnlyTokenFromResponse(Result<dynamic> result) {
    if (result.isSuccess && result.token != null) {
      authToken = result.token;
      _localStorageService.saveAccessToken(result.token!);
      _localStorageService.saveRefreshToken(result.refreshToken!);

      logger.i('Token set from response');
    }
  }

  void updateUserInfoFromResponse(Result<dynamic> result) {
    if (result.isSuccess && result.getNestedField(['data']) != null) {
      final userData = result.getNestedField(['data']);
      final user = User.fromJson(userData);

      // final user = User.fromJson(result.getNestedField(['data', 'user']));
      _localStorageService.saveUser(user);
      logger.i('User info updated from response $user');
    }
  }

  // void setAllInfoOnboarding(Result<dynamic> result) {
  //   if (result.isSuccess && result.getNestedField(['data', 'user'])!= null) {
  //     final user = User.fromJson(result.getNestedField(['data', 'user']));
  //     _localStorageService.saveUser(user);
  //     logger.i('User info set from response $user');
  //   }
  // }

  void setAgoraTokenFromResponse(Result<dynamic> result) {
    if (result.isSuccess && result.agoraToken != null) {
      _localStorageService.saveAgoraToken(result.agoraToken!);
      logger.i('Agora token set from response');
    }
  }

  // Method to clear token (for logout)
  void clearToken() {
    authToken = null;
    _localStorageService.clearTokens();
    logger.i('Token cleared');
  }

  // GET request with error handling
  Future<Result<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) fromJson,
    bool requiresAuth = true,
  }) async {
    try {
      // Check if auth is required but token is missing
      if (requiresAuth && (_authToken == null || _authToken!.isEmpty)) {
        return Result.failure(AuthFailure(
          customMessage: 'Authentication required',
          stackTrace: StackTrace.current,
        ));
      }

      final response = await _dio.get(path, queryParameters: queryParameters);

      return Result.success(fromJson(response.data));
    } catch (e, stackTrace) {
      return Result.failure(_handleDioError(e, stackTrace));
    }
  }

  // POST request with error handling
  Future<Result<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) fromJson,
    bool requiresAuth = true,
  }) async {
    try {
      // Check if auth is required but token is missing
      if (requiresAuth && (_authToken == null || _authToken!.isEmpty)) {
        return Result.failure(AuthFailure(
          customMessage: 'Authentication required',
          stackTrace: StackTrace.current,
        ));
      }

      final response =
          await _dio.post(path, data: data, queryParameters: queryParameters);
      return Result.success(fromJson(response.data));
    } catch (e, stackTrace) {
      return Result.failure(_handleDioError(e, stackTrace));
    }
  }

  // PUT request with error handling
  Future<Result<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) fromJson,
    bool requiresAuth = true,
  }) async {
    try {
      // Check if auth is required but token is missing
      if (requiresAuth && (_authToken == null || _authToken!.isEmpty)) {
        return Result.failure(AuthFailure(
          customMessage: 'Authentication required',
          stackTrace: StackTrace.current,
        ));
      }

      final response =
          await _dio.put(path, data: data, queryParameters: queryParameters);
      return Result.success(fromJson(response.data));
    } catch (e, stackTrace) {
      return Result.failure(_handleDioError(e, stackTrace));
    }
  }

  // DELETE request with error handling
  Future<Result<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) fromJson,
    bool requiresAuth = true,
  }) async {
    try {
      // Check if auth is required but token is missing
      if (requiresAuth && (_authToken == null || _authToken!.isEmpty)) {
        return Result.failure(AuthFailure(
          customMessage: 'Authentication required',
          stackTrace: StackTrace.current,
        ));
      }

      final response =
          await _dio.delete(path, data: data, queryParameters: queryParameters);
      return Result.success(fromJson(response.data));
    } catch (e, stackTrace) {
      return Result.failure(_handleDioError(e, stackTrace));
    }
  }

  Future<Result<T>> uploadFile<T>(
    String path, {
    required File file,
    required String fileField,
    Map<String, dynamic>? fields,
    required T Function(dynamic data) fromJson,
    bool requiresAuth = true,
    void Function(int sent, int total)? onSendProgress,
  }) async {
    try {
      // Check if auth is required but token is missing
      if (requiresAuth && (_authToken == null || _authToken!.isEmpty)) {
        return Result.failure(AuthFailure(
          customMessage: 'Authentication required',
          stackTrace: StackTrace.current,
        ));
      }
      // Create form data
      final formData = FormData();
      // Add the file
      final fileName = file.path.split('/').last;
      final fileExtension = fileName.split('.').last;

      logger.d("request fields: $fileName");
      // Add additional fields if provided
      if (fields != null) {
        fields.forEach((key, value) {
          formData.fields.add(MapEntry(key, value.toString()));
        });
      }
      formData.files.add(
        MapEntry(
          fileField,
          await MultipartFile.fromFile(
            file.path,
            filename: fileName,
            contentType: MediaType.parse(_getContentType(fileExtension)),
          ),
        ),
      );

      final response = await _dio.post(
        path,
        data: formData,
        onSendProgress: onSendProgress,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );
      logger.i('File upload completed');
      return Result.success(fromJson(response.data));
    } catch (e, stackTrace) {
      logger.e('File upload failed: $e');
      return Result.failure(_handleDioError(e, stackTrace));
    }
  }

  // Helper method to convert Dio errors to our Failure types
  Failure _handleDioError(dynamic error, StackTrace stackTrace) {
    logger.e('API Error: $error');

    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return TimeoutFailure(exception: error, stackTrace: stackTrace);

        case DioExceptionType.badCertificate:
        case DioExceptionType.connectionError:
          return SocketFailure(exception: error, stackTrace: stackTrace);

        case DioExceptionType.badResponse:
          final statusCode = error.response?.statusCode;
          if (statusCode == 401 || statusCode == 403) {
            _navigationService.clearStackAndShow(Routes.loginView);
            return AuthFailure(
                customMessage:
                    error.response?.data?['message'] ?? 'Authentication failed',
                exception: error,
                stackTrace: stackTrace);
          } else if (statusCode == 400) {
            // Handle 400 Bad Request errors
            String errorMessage = 'Bad request';

            try {
              final responseData = error.response?.data;
              if (responseData != null) {
                if (responseData is Map &&
                    responseData.containsKey('message')) {
                  errorMessage = responseData['message'].toString();
                } else if (responseData is String) {
                  errorMessage = responseData;
                }
              }
            } catch (e) {
              logger.e('Error parsing bad request response: $e');
            }

            return ValidationFailure(
                customMessage: errorMessage,
                statusCode: statusCode,
                exception: error,
                stackTrace: stackTrace);
          } else if (statusCode == 422) {
            // Handle validation errors (422 Unprocessable Entity)
            String errorMessage = 'Validation failed';

            // Try to extract detailed validation errors
            try {
              final responseData = error.response?.data;
              if (responseData != null && responseData is Map) {
                if (responseData.containsKey('message') &&
                    responseData['message'] is Map) {
                  // Format validation errors
                  final errors = responseData['errors'] as Map;
                  final errorList = <String>[];

                  errors.forEach((field, messages) {
                    if (messages is List) {
                      for (var message in messages) {
                        errorList.add('$message');
                      }
                    } else if (messages is String) {
                      errorList.add(messages);
                    }
                  });

                  if (errorList.isNotEmpty) {
                    errorMessage = errorList.join(', ');
                    logger.e('Validation errors: $errorMessage');
                  }
                } else if (responseData.containsKey('message')) {
                  errorMessage = responseData['message'].toString();
                }
              }
            } catch (e) {
              logger.e('Error parsing validation errors: $e');
            }

            return ValidationFailure(
                customMessage: errorMessage,
                statusCode: statusCode,
                exception: error,
                stackTrace: stackTrace);
          } else if (statusCode == 413) {
            return ValidationFailure(
                customMessage: 'File size is too large',
                statusCode: statusCode,
                exception: error,
                stackTrace: stackTrace);
          }
          return ServerFailure(
              statusCode: statusCode,
              customMessage: error.response?.data?['error'] ?? 'Server error',
              exception: error,
              stackTrace: stackTrace);

        case DioExceptionType.cancel:
          return NetworkFailure(
              customMessage: 'Request was cancelled',
              exception: error,
              stackTrace: stackTrace);

        case DioExceptionType.unknown:
          if (error.error is SocketException) {
            return SocketFailure(exception: error, stackTrace: stackTrace);
          } else if (error.error is FormatException) {
            return FormatFailure(exception: error, stackTrace: stackTrace);
          } else if (error.error is TimeoutException) {
            return TimeoutFailure(exception: error, stackTrace: stackTrace);
          }
          return InternalFailure(exception: error, stackTrace: stackTrace);
      }
    } else if (error is TimeoutException) {
      return TimeoutFailure(exception: error, stackTrace: stackTrace);
    } else if (error is SocketException) {
      return SocketFailure(exception: error, stackTrace: stackTrace);
    } else if (error is FormatException) {
      return FormatFailure(exception: error, stackTrace: stackTrace);
    }

    return InternalFailure(exception: error, stackTrace: stackTrace);
  }
}

// Result class to handle success and failure cases
class Result<T> {
  final T? data;
  final Failure? failure;

  Result.success(this.data) : failure = null;
  Result.failure(this.failure) : data = null;

  bool get isSuccess => failure == null;
  bool get isFailure => failure != null;

  // Helper method to safely get data with a default value
  T getDataOrDefault(T defaultValue) {
    return data ?? defaultValue;
  }

  // Helper method to get a specific field from the data if it's a Map
  dynamic getField(String fieldName) {
    if (isSuccess && data is Map) {
      return (data as Map)[fieldName];
    }
    return null;
  }

  // helper method to get a specific field from the data if it's a List
  dynamic getFieldFromList(String fieldName) {
    if (isSuccess && data is List) {
      final listData = data as List;
      if (listData.isNotEmpty && listData[0] is Map) {
        return (listData[0] as Map)[fieldName];
      }
    }
    return null;
  }

  // Helper method to access nested data fields
  dynamic getNestedField(List<String> fieldPath) {
    if (!isSuccess || data == null) return null;

    dynamic current = data;
    for (final field in fieldPath) {
      if (current is Map && current.containsKey(field)) {
        current = current[field];
      } else {
        return null;
      }
    }
    return current;
  }

  // Convenience methods for common response fields
  String? get message => getField('msg') as String?;
  bool get success => getField('success') == true;

  // Get auth token from response
  String? get token =>
      getNestedField(['data', 'auth_tokens', 'access_token']) as String?;
  String? get refreshToken =>
      getNestedField(['data', 'auth_tokens', 'refresh_token']) as String?;

  String? get agoraToken =>
      getNestedField(['data', 'agora_user_token']) as String?;

  // Get user data from response
  Map<String, dynamic>? get userData {
    final user = getNestedField(['data', 'user']);
    return user is Map<String, dynamic> ? user : null;
  }

  // Helper method to log the data for debugging
  void logData(String tag) {
    final logger = getLogger(tag);
    if (isSuccess) {
      logger.i('Success result data: $data');

      // Log specific fields for auth responses
      if (token != null) {
        logger.i('Token: $token');
      }
      if (userData != null) {
        logger.i('User data: $userData');
      }
    } else {
      logger.e('Failure: ${failure?.message}');
    }
  }
}

// POST request with multipart data for file uploads
// Helper method to determine content type based on file extension
String _getContentType(String extension) {
  switch (extension.toLowerCase()) {
    case 'jpg':
    case 'jpeg':
      return 'image/jpeg';
    case 'png':
      return 'image/png';
    case 'gif':
      return 'image/gif';
    case 'pdf':
      return 'application/pdf';
    case 'doc':
      return 'application/msword';
    case 'docx':
      return 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
    // Add more types as needed
    default:
      return 'application/octet-stream'; // Default binary data
  }
}
