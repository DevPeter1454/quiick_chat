import 'dart:io';

import 'package:quiick_chat/app/app.locator.dart';
import 'package:quiick_chat/app/app.logger.dart';
import 'package:quiick_chat/models/export.dart';
import 'package:quiick_chat/repository/auth_repository/auth_service.dart';
import 'package:quiick_chat/services/export.dart';
import 'package:quiick_chat/services/local_storage_service.dart';
import 'package:quiick_chat/shared/export.dart';

class AuthServiceImpl extends IAuthService {
  final _apiService = locator<ApiService>();
  final _localStorageService = locator<LocalStorageService>();

  final logger = getLogger('AuthServiceImpl');
  // Implement your methods here
  @override
  Future<Result<dynamic>> register({required String phone}) async {
    try {
      final data = {
        'phone': phone,
      };

      logger.d('Sending registration request with data: $data');

      final result = await _apiService.post<dynamic>(
        ApiUrls.registerUrl,
        data: data,
        fromJson: (data) => data,
        requiresAuth: false,
      );

      return result;
    } catch (e, stackTrace) {
      logger.e('Registration failed: $e, $stackTrace');
      return Result.failure(
          InternalFailure(exception: e, stackTrace: stackTrace));
    }
  }

  @override
  Future<Result<dynamic>> login({required String phone}) async {
    try {
      final data = {
        'phone': phone,
      };

      logger.d('Sending registration request with data: $data');

      final result = await _apiService.post<dynamic>(
        ApiUrls.loginUrl,
        data: data,
        fromJson: (data) => data,
        requiresAuth: false,
      );

      // _apiService.setTokenFromResponse(result);

      return result;
    } catch (e, stackTrace) {
      logger.e('Registration failed: $e');
      return Result.failure(
          InternalFailure(exception: e, stackTrace: stackTrace));
    }
  }

  @override
  Future<Result<dynamic>> verifyLogin({
    required String phone,
    required String code,
  }) async {
    try {
      final data = {
        'phone': phone,
        'code': code,
      };
      logger.d('Sending registration request with data: $data');
      final result = await _apiService.post<dynamic>(
        ApiUrls.verifyLoginUrl,
        data: data,
        fromJson: (data) => data,
        requiresAuth: false,
      );
      _apiService.setTokenFromResponse(result);
      return result;
    } catch (e, stackTrace) {
      logger.e('Verify login failed: $e');
      return Result.failure(
          InternalFailure(exception: e, stackTrace: stackTrace));
    }
  }

  @override
  Future<Result<dynamic>> verifyPhoneNumber({
    required String phone,
    required String code,
  }) async {
    try {
      final data = {
        'phone': phone,
        'code': code,
      };
      logger.d('Sending registration request with data: $data');
      final result = await _apiService.post<dynamic>(
        ApiUrls.verifyOtpUrl,
        data: data,
        fromJson: (data) => data,
        requiresAuth: false,
      );
      _apiService.setTokenFromResponse(result);
      // _apiService.
      return result;
    } catch (e, stackTrace) {
      logger.e('Verify phone number failed: $e');
      return Result.failure(
          InternalFailure(exception: e, stackTrace: stackTrace));
    }
  }

  @override
  Future<Result<dynamic>> resendOtp({
    required String phone,
  }) async {
    try {
      final data = {
        'phone': phone,
      };
      logger.d('Sending registration request with data: $data');
      final result = await _apiService.post<dynamic>(
        ApiUrls.resendOtpUrl,
        data: data,
        fromJson: (data) => data,
        requiresAuth: false,
      );
      return result;
    } catch (e, stackTrace) {
      logger.e('Resend OTP failed: $e');
      return Result.failure(
          InternalFailure(exception: e, stackTrace: stackTrace));
    }
  }

  @override
  Future<Result<dynamic>> getUserDetails({
    required String phone,
  }) async {
    return Result.failure(Failure("Not implemented yet"));
  }

  @override
  Future<Result<dynamic>> refreshToken() async {
    try {
      final dataT = {"refresh_token": _localStorageService.getRefreshToken()};
      logger.d('Sending refresh token request with data: $dataT');

      final result = await _apiService.post(
        ApiUrls.refreshTokenUrl,
        data: dataT,
        fromJson: (data) =>
            data, // This should parse the response JSON, not the request data
        requiresAuth: false,
      );

      logger.d(
          'Refresh token result: ${result.isSuccess ? 'Success' : 'Failure: ${result.failure}'}');
      _apiService.setOnlyTokenFromResponse(result);
      return result;
    } catch (e, stackTrace) {
      logger.e('Refresh token failed: $e');
      return Result.failure(
          InternalFailure(exception: e, stackTrace: stackTrace));
    }
  }

  @override
  Future<Result<dynamic>> uploadUserProfilePhoto({
    required String userID,
    required File image,
  }) async {
    try {
      final dataT = {
        'user_id': userID,
      };
      final result = await _apiService.uploadFile(
        '${ApiUrls.uploadProfilePhotoUrl}/profile/picture',
        file: image,
        fileField: 'profile_picture',
        fields: dataT,
        fromJson: (dataT) => dataT,
        onSendProgress: (sent, total) {
          final progress = (sent / total) * 100;
          print('Upload progress: ${progress.toStringAsFixed(2)}%');
        },
      );
      return result;
    } catch (e, stackTrace) {
      logger.e('Upload profile photo failed: $stackTrace');
      return Result.failure(
          InternalFailure(exception: e, stackTrace: stackTrace));
    }
  }

  @override
  Future<Result<dynamic>> getUserProfilePhoto({
    required String userID,
  }) async {
    return Result.failure(Failure("Not implemented yet"));
  }

  @override
  Future<Result<dynamic>> getAgoraToken() async {
    try {
      final data = {};
      final result = await _apiService.post(ApiUrls.getAgoraTokenUrl,
          fromJson: (data) => data, requiresAuth: true);

      return result;
    } catch (e, stackTrace) {
      logger.e('Get agora token failed: $stackTrace');
      return Result.failure(
          InternalFailure(exception: e, stackTrace: stackTrace));
    }
    // return Result.failure(Failure("Not implemented yet"));
  }

  @override
  Future<Result<dynamic>> uploadUserProfilePhotoUrl({
    required String userID,
    required String imageUrl,
    required String userName,
  }) async {
    try {
      final data = {
        "username": userName,
        "profile_picture": imageUrl,
        "status": "online",
        "user_id": userID,
      };

      final result = await _apiService.put(
        '${ApiUrls.uploadProfilePhotoUrl}profile',
        data: data,
        fromJson: (data) => data,
        requiresAuth: true,
      );

      _apiService.updateUserInfoFromResponse(result);

      return result;
    } catch (e, stackTrace) {
      logger.e('Upload profile photo failed: $stackTrace');
      return Result.failure(
          InternalFailure(exception: e, stackTrace: stackTrace));
    }
  }
}
