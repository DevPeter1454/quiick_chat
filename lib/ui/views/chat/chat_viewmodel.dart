import 'package:quiick_chat/app/app.dialogs.dart' as quiick_chat_dialogs;
import 'package:quiick_chat/app/app.locator.dart';
import 'package:quiick_chat/app/app.logger.dart';
import 'package:quiick_chat/app/app.router.dart';
import 'package:quiick_chat/repository/agora_repository/agora_service.dart';
import 'package:quiick_chat/services/loading_service.dart';
import 'package:quiick_chat/services/toast_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChatViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _agoraService = locator<IAgoraService>();
  final _loadingService = locator<LoadingService>();
  final _toastService = locator<ToastService>();
  final logger = getLogger('ChatViewModel');

  void navigateToMessageView(String userId) {
    _navigationService.navigateTo(Routes.messageChatView,
        arguments: MessageChatViewArguments(userId: userId));
  }

  String _phoneNumber = '';
  String get phoneNumber => _phoneNumber;
  void setPhoneNumber(String value) {
    _phoneNumber = value;
    logger.i('Phone Number: $_phoneNumber');
    notifyListeners();
    getUserChatCredInfo();
  }

  Future<void> showAddContactDialog() async {
    final res = await _dialogService.showCustomDialog(
      variant: quiick_chat_dialogs.DialogType.addContact,
      title: 'Add Contact',
      description: 'Enter the contact number',
      barrierDismissible: true,
    );
    if (res == null || res.confirmed == false) return;
    final filledNumber = res.data["phone"] as String;
    setPhoneNumber(filledNumber);
  }

  Future<void> getUserChatCredInfo() async {
    try {
      _loadingService.showLoading(loadingText: "Fetching details");
      final res = await _agoraService.getContactCredInfo(contact: phoneNumber);
      if (res.isSuccess) {
        logger.d(res.getNestedField(["data", "agora_chat_info"]));
        final userId =
            res.getNestedField(["data", "agora_chat_info", "username"]);
        // final avatarUrl
        _navigationService.navigateTo(Routes.messageChatView,
            arguments: MessageChatViewArguments(userId: userId));
      } else {
        _toastService.handleFailure(res.failure,
            context: "Fetching details failed");
      }
    } catch (e) {
      logger.e(e);
      _toastService.showError("Error", "Fetching details failed");
    } finally {
      _loadingService.hideLoading();
    }
  }
}
