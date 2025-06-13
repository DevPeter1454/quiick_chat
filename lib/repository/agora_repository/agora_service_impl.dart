import 'package:quiick_chat/app/app.locator.dart';
import 'package:quiick_chat/models/export.dart';
import 'package:quiick_chat/repository/agora_repository/agora_service.dart';
import 'package:quiick_chat/services/export.dart';
import 'package:quiick_chat/services/local_storage_service.dart';
import 'package:quiick_chat/shared/api_urls.dart' show ApiUrls;

class AgoraServiceImpl extends IAgoraService {
  final _apiService = locator<ApiService>();
  final _localStorageService = locator<LocalStorageService>();
  @override
  Future<Result<dynamic>> generateAgoraToken() async {
    try {
      final data = {};
      final result = await _apiService.post(ApiUrls.getAgoraTokenUrl,
          fromJson: (data) => data, requiresAuth: true);
      _apiService.setAgoraTokenFromResponse(result);
      return result;
    } catch (e, stackTrace) {
      return Result.failure(
          InternalFailure(exception: e, stackTrace: stackTrace));
    }
  }

  @override
  Future<Result<dynamic>> addContact({
    required String contact,
    required String username,
  }) async {
    try {
      final data = {};

      final result = await _apiService.post(
          "${ApiUrls.getContactsUrl}/$username/$contact",
          fromJson: (data) => data,
          requiresAuth: true);
      return result;
    } catch (e, stackTrace) {
      return Result.failure(
          InternalFailure(exception: e, stackTrace: stackTrace));
    }
  }

  @override
  Future<Result<dynamic>> getContactCredInfo({
    required String contact,
  }) async {
    try {
      final data = {
        "phone": contact,
      };
      final result = await _apiService.post(ApiUrls.getChatCredInfo,
          data: data, fromJson: (data) => data, requiresAuth: true);
      return result;
    } catch (e, stackTrace) {
      return Result.failure(
          InternalFailure(exception: e, stackTrace: stackTrace));
    }
  }
}
