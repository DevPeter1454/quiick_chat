import 'dart:io';

import 'package:quiick_chat/services/export.dart';

abstract class IAuthService {
  Future<Result<dynamic>> register({
    required String phone,
  });

  Future<Result<dynamic>> login({
    required String phone,
  });

  Future<Result<dynamic>> verifyLogin({
    required String phone,
    required String code,
  });

  Future<Result<dynamic>> verifyPhoneNumber({
    required String phone,
    required String code,
  });

  Future<Result<dynamic>> resendOtp({
    required String phone,
  });

  Future<Result<dynamic>> getUserDetails({
    required String phone,
  });

  Future<Result<dynamic>> refreshToken();

  Future<Result<dynamic>> uploadUserProfilePhoto({
    required String userID,
    required File image,
  });

  Future<Result<dynamic>> getUserProfilePhoto({
    required String userID,
  });

  Future<Result<dynamic>> getAgoraToken();

  Future<Result<dynamic>> uploadUserProfilePhotoUrl({
    required String userID,
    required String imageUrl,
    required String userName,
  });
}
