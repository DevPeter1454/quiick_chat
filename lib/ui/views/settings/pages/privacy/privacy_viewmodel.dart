import 'package:quiick_chat/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PrivacyViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void back() {
    _navigationService.back();
  }

  final List<Map<String, dynamic>> _privacyItems = [
    {
      "title": "Blocked contact",
      "subtitle": "4",
    },
    {
      "title": "Phone number",
      "subtitle": "Everybody",
    },
    {
      "title": "Last seen",
      "subtitle": "Nobody",
    },
    {
      "title": "Bio",
      "subtitle": "Nobody",
    },
    {
      "title": "Calls",
      "subtitle": "Nobody",
    },
    {
      "title": "Address",
      "subtitle": "Everybody",
    }
  ];

  List<Map<String, dynamic>> get privacyItems => _privacyItems;

  bool _isChatLockActivated = false;
  bool get isChatLockActivated => _isChatLockActivated;
  void toggleChatLock(bool value) {
    _isChatLockActivated = value;
    notifyListeners();
  }
}
