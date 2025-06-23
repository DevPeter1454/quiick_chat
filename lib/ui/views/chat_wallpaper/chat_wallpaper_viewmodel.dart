import 'package:quiick_chat/app/app.locator.dart';
import 'package:quiick_chat/app/app.logger.dart';
import 'package:quiick_chat/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChatWallpaperViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final logger = getLogger('OnboardingPhoneViewModel');
  // create some values

  void back() {
    _navigationService.back();
  }

  void navigateToChatColor() {
    _navigationService.navigateTo(Routes.chatColorView);
  }
}
