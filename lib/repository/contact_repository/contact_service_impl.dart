import 'package:quiick_chat/app/app.locator.dart';
import 'package:quiick_chat/app/app.logger.dart';
import 'package:quiick_chat/models/export.dart';
import 'package:quiick_chat/repository/contact_repository/contact_service.dart';
import 'package:quiick_chat/services/export.dart';
import 'package:quiick_chat/shared/export.dart';

class ContactServiceImpl extends IContactService {
  final _apiService = locator<ApiService>();
  // final _localStorageService = locator<LocalStorageService>();

  final logger = getLogger('ContactServiceImpl');
  // Implement your methods here

  @override
  Future<Result> uploadContact(
      {required List<Map<String, String>> contactList}) async {
    // TODO: implement uploadContact
    try {
      final cdata = {'contacts': contactList};
      logger.d('Sending contact upload request with data: $cdata');

      final result = await _apiService.post<dynamic>(
        ApiUrls.uploadContactUrl,
        data: cdata,
        fromJson: (data) => data,
        requiresAuth: true,
      );
      print('data:${result.data}');

      return result;
    } catch (e, stackTrace) {
      logger.e('Contact upload failed: $e, $stackTrace');
      return Result.failure(
          InternalFailure(exception: e, stackTrace: stackTrace));
    }
  }
}
