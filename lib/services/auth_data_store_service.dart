import 'package:quiick_chat/app/app.logger.dart';

class AuthDataStoreService {
  final logger = getLogger('AuthDataStoreService');

  String? _phone;
  String? get phone => _phone;
  void setPhone(String phone) {
    _phone = phone;
  }

  void clearPhone() {
    _phone = null;
  }
}
