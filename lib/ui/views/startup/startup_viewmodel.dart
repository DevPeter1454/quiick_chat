import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:quiick_chat/services/local_storage_service.dart';
import 'package:quiick_chat/ui/common/export.dart';
import 'package:stacked/stacked.dart';
import 'package:quiick_chat/app/app.locator.dart';
import 'package:quiick_chat/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _localStorageService = locator<LocalStorageService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));
    if (_localStorageService.getAccessToken() != null) {
      _navigationService.replaceWith(Routes.loginView);
      return;
    }

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic
    _navigationService.replaceWithBottomNavBarView();
    //_navigationService.replaceWithOnboardingView();
  }

  Future<void> addChatColor() async {
    String? chatColor = _localStorageService.getChatColorToken();
    if (chatColor == null) {
      _localStorageService
          .saveChatColorToken(AppColors.kcPrimaryColor.toHexString());
    }
    return;
  }
}
