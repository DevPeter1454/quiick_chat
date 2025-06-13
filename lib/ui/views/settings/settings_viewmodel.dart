import 'package:quiick_chat/app/app.locator.dart';
import 'package:quiick_chat/app/app.router.dart';
import 'package:quiick_chat/services/local_storage_service.dart';
import 'package:quiick_chat/ui/common/export.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SettingsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _localStorageService = locator<LocalStorageService>();

  String _userName = "";
  String get userName => _userName;

  void setUserName() {
    _userName = _localStorageService.getUser()!.username;
    _settings[0] = _userName;
    notifyListeners();
  }

  final List<String> _settings = [
    "Username",
    "Starred Messages",
    // "Wallet",
    "Linked Device",
    "Language",
    "Privacy",
    "Notification",
    "Storage and Data",
    "Wallpaper",
    "Translate",
  ];
  List<String> get settings => _settings;

  final List<String> _settingsIcons = [
    SettingsIcons.userIcon,
    SettingsIcons.starredMessagesIcon,
    // SettingsIcons.walletIcon,
    SettingsIcons.linkIcon,
    SettingsIcons.languageIcon,
    SettingsIcons.privacyIcon,
    SettingsIcons.notificationIcon,
    SettingsIcons.storageIcon,
    SettingsIcons.wallpaperIcon,
    SettingsIcons.translateIcon,
  ];
  List<String> get settingsIcons => _settingsIcons;

  void navigateTo(int index) async {
    switch (index) {
      case 0:
        final res = await _navigationService.navigateTo(Routes.profileView);
        if (res != null) {
          setUserName();
        }
        break;
      case 1:
        _navigationService.navigateTo(Routes.starredMessagesView);
        break;
      case 2:
        // _navigationService.navigateTo(Routes.walletView);
        _navigationService.navigateTo(Routes.linkedDevicesView);

        break;
      case 3:
        // _navigationService.navigateTo(Routes.linkedDevicesView);
        _navigationService.navigateTo(Routes.languageView);

        break;
      case 4:
        // _navigationService.navigateTo(Routes.languageView);
        _navigationService.navigateTo(Routes.privacyView);

        break;
      case 5:
        // _navigationService.navigateTo(Routes.privacyView);
        _navigationService.navigateTo(Routes.notificationsView);

        break;
      case 6:
        // _navigationService.navigateTo(Routes.notificationsView);
        _navigationService.navigateTo(Routes.storageAndDataView);

        break;
      case 7:
        // _navigationService.navigateTo(Routes.storageAndDataView);
        _navigationService.navigateTo(Routes.wallpaperView);
        break;
      case 8:
        // _navigationService.navigateTo(Routes.wallpaperView);
        _navigationService.navigateTo(Routes.translateView);
        break;
      case 9:
        // _navigationService.navigateTo(Routes.translateView);
        break;
    }
  }
}
