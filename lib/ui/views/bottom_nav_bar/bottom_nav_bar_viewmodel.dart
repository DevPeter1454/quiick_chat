import 'package:flutter/material.dart';
import 'package:quiick_chat/app/app.locator.dart';
import 'package:quiick_chat/services/local_storage_service.dart';
import 'package:quiick_chat/ui/common/export.dart';
import 'package:quiick_chat/ui/views/call/call_view.dart';
import 'package:quiick_chat/ui/views/chat/chat_view.dart';
import 'package:quiick_chat/ui/views/chat_wallpaper/chat_wallpaper_view.dart';
// import 'package:quiick_chat/ui/views/contact/contact_view.dart';
import 'package:quiick_chat/ui/views/settings/settings_view.dart';
import 'package:quiick_chat/ui/views/update/update_view.dart';
import 'package:stacked/stacked.dart';

class BottomNavBarViewModel extends IndexTrackingViewModel {
  final _localStorageService = locator<LocalStorageService>();

  Future colorChat() async {
    await Future.delayed(const Duration(seconds: 3));
    String? colorChat = _localStorageService.getChatColorToken();
    if (colorChat != null) {
      _pages = [
        const UpdateView(),
        const ChatView(),
        const CallView(),
        ChatWallpaperView(colorString: colorChat),
        const SettingsView()
      ];
      notifyListeners();
    }
  }

  List<Widget> _pages = [
    const UpdateView(),
    const ChatView(),
    const CallView(),
    const ChatWallpaperView(colorString: '0xff000000'),
    const SettingsView()
  ];
  List<Widget> get pages => _pages;

  final List<String> _title = const <String>[
    'Update',
    'Chat',
    'Call',
    'Contact',
    'Settings'
  ];
  List<String> get title => _title;

  final List<String> _icons = const <String>[
    BottomNavIcons.updateIcon,
    BottomNavIcons.chatIcon,
    BottomNavIcons.callIcon,
    BottomNavIcons.contactIcon,
    BottomNavIcons.settingsIcon,
  ];
  List<String> get icons => _icons;
  final List<String> _activeIcons = const <String>[
    BottomNavIcons.updateFilledIcon,
    BottomNavIcons.chatFilledIcon,
    BottomNavIcons.callFilledIcon,
    BottomNavIcons.contactFilledIcon,
    BottomNavIcons.settingsFilledIcon,
  ];
  List<String> get activeIcons => _activeIcons;
}
