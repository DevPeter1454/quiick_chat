import 'package:flutter/material.dart';
import 'package:quiick_chat/ui/common/export.dart';
import 'package:quiick_chat/ui/views/call/call_view.dart';
import 'package:quiick_chat/ui/views/chat/chat_view.dart';
import 'package:quiick_chat/ui/views/contact/contact_view.dart';
import 'package:quiick_chat/ui/views/settings/settings_view.dart';
import 'package:quiick_chat/ui/views/update/update_view.dart';
import 'package:stacked/stacked.dart';

class BottomNavBarViewModel extends IndexTrackingViewModel {
  final List<Widget> _pages = [
    const UpdateView(),
    const ChatView(),
    const CallView(),
    const ContactView(),
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
