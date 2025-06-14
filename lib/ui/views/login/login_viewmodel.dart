// import 'package:agora_chat_uikit/sdk_service/chat_sdk_service.dart';
import 'package:quiick_chat/app/app.dialogs.dart' show DialogType;
import 'package:quiick_chat/app/app.locator.dart';
import 'package:quiick_chat/app/app.logger.dart' show getLogger;
import 'package:quiick_chat/repository/export.dart';
import 'package:quiick_chat/services/export.dart';
import 'package:quiick_chat/services/local_storage_service.dart'
    show LocalStorageService;
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final _localStorageService = locator<LocalStorageService>();
  final _navigationService = locator<NavigationService>();
  final _authService = locator<IAuthService>();
  final _toastService = locator<ToastService>();
  final _loadingService = locator<LoadingService>();
  final _dialogService = locator<DialogService>();
  final _agoraService = locator<IAgoraService>();

  final logger = getLogger('LoginViewModel');

  void showCodeInputDialog() async {
    final dialogResponse = await _dialogService.showCustomDialog(
      variant: DialogType.codeInput,
      title: "Enter Code",
      description: "Please enter the code sent to your phone number",
    );
    if (dialogResponse == null) return;
    if (dialogResponse.confirmed) {
      if (dialogResponse.data["isResend"]) {
        resendOtp();
        return;
      } else {}
    }
  }

  Future<void> requestLoginCode() async {
    try {
      _loadingService.showLoading(loadingText: 'Sending code...');
      String phoneNumber = _localStorageService.getUser()!.phone;
      final res = await _authService.login(phone: phoneNumber);
      if (res.success) {
        final code = res.getField("code");
        _toastService.showSuccess("Success", "Code sent successfully $code ");
        showCodeInputDialog();
      } else {
        _toastService.handleFailure(res.failure, context: "Login Failed");
      }
    } catch (e) {
      logger.e(e);
      _toastService.showError("Error", "Error sending verification code");
    } finally {
      _loadingService.hideLoading();
    }
  }

  Future<void> resendOtp() async {
    try {
      _loadingService.showLoading(loadingText: "Resending otp...");
      final res = await _authService.resendOtp(
          phone: _localStorageService.getUser()!.phone);
      if (res.success) {
        final code = res.getField("code");
        logger.d("code: $code");
        _toastService.showSuccess(
          'Success',
          'Otp resent successfully. Use the code: $code',
        );
      } else {
        _toastService.handleFailure(res.failure, context: "Otp resend Failed");
      }
    } catch (e) {
      logger.e(e);
      _toastService.showError(
        'Error',
        'Otp resend Failed',
      );
    } finally {
      _loadingService.hideLoading();
    }
  }

  Future<void> refreshToken() async {
    try {
      _loadingService.showLoading(loadingText: "");
      final res = await _authService.refreshToken();
      if (res.success) {
        // _toastService.showSuccess("Success", "Token refreshed successfully");
      } else {
        // _toastService.handleFailure(res.failure,
        //     context: "Token refresh Failed");
      }
    } catch (e) {
      logger.e(e);
      _loadingService.hideLoading();
    } finally {
      // _loadingService.hideLoading();
    }
  }

  Future<void> getAgoraToken() async {
    try {
      setBusy(true);
      final res = await _agoraService.generateAgoraToken();
      if (res.success) {
        logger.d("token:");
      } else {
        logger.e(res.failure);
        _toastService.handleFailure(res.failure,
            context: "Token refresh Failed");
      }
    } catch (e) {
      logger.e(e);
      _toastService.showError("Error", "Error initiating app");
    } finally {
      setBusy(false);
    }
  }

  // Future<void> loginIntoAgora() async {
  //   // logger.d(_localStorageService.getRefreshToken());
  //   await refreshToken();
  //   try {
  //     final agoraUsername =
  //         _localStorageService.getUser()!.agoraChatInfo!.username;
  //     final agoraPassword =
  //         _localStorageService.getUser()!.agoraChatInfo!.password;
  //     bool connected = await ChatClient.getInstance.isConnected();
  //     if (connected) {
  //       await ChatClient.getInstance.logout();
  //     }
  //     _loadingService.showLoading(loadingText: "");
  //     await ChatClient.getInstance
  //         .loginWithPassword(agoraUsername, agoraPassword!)
  //         .then((value) {
  //       logger.d("login success");
  //     }).whenComplete(() {
  //       _loadingService.hideLoading();
  //     });
  //     bool isconnected = await ChatClient.getInstance.isConnected();
  //     logger.d("connected: $isconnected");

  //     await ChatClient.getInstance.startCallback().then((value) {
  //       setupListeners();
  //       _navigationService.navigateTo(Routes.bottomNavBarView);
  //     });
  //     // bool isConnected = await ChatClient.getInstance.isConnected();
  //     // print("connected $isConnected");
  //   } catch (e) {
  //     logger.e(e);
  //     _toastService.showError("Error", "Error initiating app");
  //   }
  // }

  // void setupListeners() {
  //   var agoraChatClient = ChatClient.getInstance;

  //   agoraChatClient.addConnectionEventHandler(
  //     "CONNECTION_HANDLER",
  //     ConnectionEventHandler(
  //         onConnected: onConnected,
  //         onDisconnected: onDisconnected,
  //         onTokenWillExpire: onTokenWillExpire,
  //         onTokenDidExpire: onTokenDidExpire),
  //   );

  //   agoraChatClient.chatManager.addEventHandler(
  //     "MESSAGE_HANDLER",
  //     ChatEventHandler(onMessagesReceived: onMessagesReceived),
  //   );
  // }

  // void onMessagesReceived(List<ChatMessage> messages) {
  //   for (var msg in messages) {
  //     if (msg.body.type == MessageType.TXT) {
  //       ChatTextMessageBody body = msg.body as ChatTextMessageBody;
  //       // displayMessage(body.content, false);
  //       // showLog("Message from ${msg.from}");
  //     } else {
  //       String msgType = msg.body.type.name;
  //       // showLog("Received $msgType message, from ${msg.from}");
  //     }
  //   }
  // }

  void onTokenWillExpire() {
    // The token is about to expire. Get a new token
    // from the token server and renew the token.
  }
  void onTokenDidExpire() {
    // The token has expired
  }
  void onDisconnected() {
    // Disconnected from the Chat server
  }
  void onConnected() {
    // showLog("Connected");
  }
}
