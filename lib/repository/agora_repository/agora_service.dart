import 'package:quiick_chat/services/api_service.dart' show Result;

abstract class IAgoraService {
  Future<Result<dynamic>> generateAgoraToken();

  Future<Result<dynamic>> addContact({
    required String contact,
    required String username,
  });

  Future<Result<dynamic>> getContactCredInfo({
    required String contact,
  });
}
