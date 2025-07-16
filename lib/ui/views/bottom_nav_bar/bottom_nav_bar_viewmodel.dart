import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quiick_chat/app/app.locator.dart';
import 'package:quiick_chat/app/app.logger.dart';
import 'package:quiick_chat/repository/contact_repository/contact_service.dart';
import 'package:quiick_chat/services/export.dart';
import 'package:quiick_chat/services/local_storage_service.dart';
import 'package:quiick_chat/ui/common/export.dart';
import 'package:quiick_chat/ui/views/call/call_view.dart';
import 'package:quiick_chat/ui/views/chat/chat_view.dart';
// import 'package:quiick_chat/ui/views/chat_wallpaper/chat_wallpaper_view.dart';
import 'package:quiick_chat/ui/views/contact/contact_view.dart';
import 'package:quiick_chat/ui/views/settings/settings_view.dart';
import 'package:quiick_chat/ui/views/update/update_view.dart';
import 'package:stacked/stacked.dart';

class BottomNavBarViewModel extends IndexTrackingViewModel {
  final _localStorageService = locator<LocalStorageService>();
  final _contactService = locator<IContactService>();
  final _toastService = locator<ToastService>();
  final logger = getLogger('BottomVavBarViewmodel');

  Future colorChat() async {
    await Future.delayed(const Duration(seconds: 3));
    String? colorChat = _localStorageService.getChatColorToken();
    if (colorChat != null) {
      return;
    }
  }

  List<Map<String, String>> makeNewContactList(List<Contact> contacts) {
    List<Map<String, String>> local = [];
    for (var i = 0; i < contacts.length; i++) {
      if (contacts[i].phones.isNotEmpty && contacts[i].displayName.isNotEmpty) {
        String contactNumber = contacts[i].phones.first.number;
        if (contactNumber.startsWith(RegExp(r'0')) &&
            contactNumber.contains(' ')) {
          contactNumber = contactNumber.replaceFirst(RegExp(r'0'), '+234 ');
          local.add({
            'display_name': contacts[i].displayName,
            'phone_number': contactNumber,
          });
        } else if (contactNumber.startsWith(RegExp(r'0'))) {
          contactNumber = contactNumber.replaceFirst(RegExp(r'0'), '+234');
          local.add({
            'display_name': contacts[i].displayName,
            'phone_number': contactNumber,
          });
        } else if ((contactNumber.startsWith('+'))) {
          local.add({
            'display_name': contacts[i].displayName,
            'phone_number': contacts[i].phones.first.number,
          });
        }
      }
    }
    return local;
  }

  Future<void> uploadLocalContact(
      List<Map<String, String>> localContacts) async {
    try {
      final res =
          await _contactService.uploadContact(contactList: localContacts);
      if (res.isSuccess) {
        _toastService.showSuccess("Success", "contacts uploaded");
        print(res.data);
      } else {
        logger.e(res.failure!.runtimeType);
        _toastService.handleFailure(res.failure,
            context: "Contact upload Failed");
      }
    } finally {}
  }

  Future<List<Contact>> loadContacts() async {
    List<Contact> contacts = [];
    List<Map<String, String>> localContact = [];
    if (await Permission.contacts.isGranted) {
      try {
        final sw = Stopwatch()..start();
        contacts = await FastContacts.getAllContacts(fields: _fields);
        sw.stop();
        localContact = makeNewContactList(contacts);
        await uploadLocalContact(localContact);
        print(
            'Contacts: ${localContact.length}\nTook: ${sw.elapsedMilliseconds}ms\nall: ${contacts[5].displayName}\nall: ${contacts[5].organization!.company}');
        _pages = [
          const UpdateView(),
          const ChatView(),
          const CallView(),
          ContactView(
            contacts: localContact,
          ),
          const SettingsView()
        ];
        notifyListeners();
      } on PlatformException catch (e) {
        print('Failed to get contacts:\n${e.details}');
      }
    } else {
      await Permission.contacts.request();
    }
    return contacts;
  }

  List<Widget> _pages = [
    const UpdateView(),
    const ChatView(),
    const CallView(),
    const ContactView(
      contacts: [],
    ),
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

  final List<ContactField> _fields = ContactField.values.toList();
}
