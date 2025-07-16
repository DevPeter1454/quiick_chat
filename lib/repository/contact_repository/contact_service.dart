import 'package:quiick_chat/services/export.dart';

abstract class IContactService {
  Future<Result<dynamic>> uploadContact(
      {required List<Map<String, String>> contactList});
}
