// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as _i35;
import 'package:quiick_chat/ui/views/bottom_nav_bar/bottom_nav_bar_view.dart'
    as _i9;
import 'package:quiick_chat/ui/views/call/call_view.dart' as _i12;
import 'package:quiick_chat/ui/views/chat/chat_view.dart' as _i13;
import 'package:quiick_chat/ui/views/chat_color/chat_color_view.dart' as _i34;
import 'package:quiick_chat/ui/views/chat_wallpaper/chat_wallpaper_view.dart'
    as _i33;
import 'package:quiick_chat/ui/views/contact/contact_view.dart' as _i14;
import 'package:quiick_chat/ui/views/create_group/create_group_view.dart'
    as _i32;
import 'package:quiick_chat/ui/views/home/home_view.dart' as _i2;
import 'package:quiick_chat/ui/views/login/login_view.dart' as _i30;
import 'package:quiick_chat/ui/views/message_chat/message_chat_view.dart'
    as _i31;
import 'package:quiick_chat/ui/views/onboarding/onboarding_view.dart' as _i4;
import 'package:quiick_chat/ui/views/onboarding_almost_done/onboarding_almost_done_view.dart'
    as _i8;
import 'package:quiick_chat/ui/views/onboarding_language/onboarding_language_view.dart'
    as _i5;
import 'package:quiick_chat/ui/views/onboarding_phone/onboarding_phone_view.dart'
    as _i6;
import 'package:quiick_chat/ui/views/onboarding_phone_otp/onboarding_phone_otp_view.dart'
    as _i7;
import 'package:quiick_chat/ui/views/settings/pages/add_card/add_card_view.dart'
    as _i16;
import 'package:quiick_chat/ui/views/settings/pages/chat_backup/chat_backup_view.dart'
    as _i24;
import 'package:quiick_chat/ui/views/settings/pages/language/language_view.dart'
    as _i27;
import 'package:quiick_chat/ui/views/settings/pages/linked_devices/linked_devices_view.dart'
    as _i26;
import 'package:quiick_chat/ui/views/settings/pages/notifications/notifications_view.dart'
    as _i21;
import 'package:quiick_chat/ui/views/settings/pages/privacy/privacy_view.dart'
    as _i20;
import 'package:quiick_chat/ui/views/settings/pages/profile/profile_view.dart'
    as _i19;
import 'package:quiick_chat/ui/views/settings/pages/send/send_view.dart'
    as _i17;
import 'package:quiick_chat/ui/views/settings/pages/send_pin/send_pin_view.dart'
    as _i18;
import 'package:quiick_chat/ui/views/settings/pages/starred_messages/starred_messages_view.dart'
    as _i25;
import 'package:quiick_chat/ui/views/settings/pages/storage/storage_view.dart'
    as _i22;
import 'package:quiick_chat/ui/views/settings/pages/storage_and_data/storage_and_data_view.dart'
    as _i23;
import 'package:quiick_chat/ui/views/settings/pages/translate/translate_view.dart'
    as _i29;
import 'package:quiick_chat/ui/views/settings/pages/wallet/wallet_view.dart'
    as _i15;
import 'package:quiick_chat/ui/views/settings/pages/wallpaper/wallpaper_view.dart'
    as _i28;
import 'package:quiick_chat/ui/views/settings/settings_view.dart' as _i10;
import 'package:quiick_chat/ui/views/startup/startup_view.dart' as _i3;
import 'package:quiick_chat/ui/views/update/update_view.dart' as _i11;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i36;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const onboardingView = '/onboarding-view';

  static const onboardingLanguageView = '/onboarding-language-view';

  static const onboardingPhoneView = '/onboarding-phone-view';

  static const onboardingPhoneOtpView = '/onboarding-phone-otp-view';

  static const onboardingAlmostDoneView = '/onboarding-almost-done-view';

  static const bottomNavBarView = '/bottom-nav-bar-view';

  static const settingsView = '/settings-view';

  static const updateView = '/update-view';

  static const callView = '/call-view';

  static const chatView = '/chat-view';

  static const contactView = '/contact-view';

  static const walletView = '/wallet-view';

  static const addCardView = '/add-card-view';

  static const sendView = '/send-view';

  static const sendPinView = '/send-pin-view';

  static const profileView = '/profile-view';

  static const privacyView = '/privacy-view';

  static const notificationsView = '/notifications-view';

  static const storageView = '/storage-view';

  static const storageAndDataView = '/storage-and-data-view';

  static const chatBackupView = '/chat-backup-view';

  static const starredMessagesView = '/starred-messages-view';

  static const linkedDevicesView = '/linked-devices-view';

  static const languageView = '/language-view';

  static const wallpaperView = '/wallpaper-view';

  static const translateView = '/translate-view';

  static const loginView = '/login-view';

  static const messageChatView = '/message-chat-view';

  static const createGroupView = '/create-group-view';

  static const chatWallpaperView = '/chat-wallpaper-view';

  static const chatColorView = '/chat-color-view';

  static const all = <String>{
    homeView,
    startupView,
    onboardingView,
    onboardingLanguageView,
    onboardingPhoneView,
    onboardingPhoneOtpView,
    onboardingAlmostDoneView,
    bottomNavBarView,
    settingsView,
    updateView,
    callView,
    chatView,
    contactView,
    walletView,
    addCardView,
    sendView,
    sendPinView,
    profileView,
    privacyView,
    notificationsView,
    storageView,
    storageAndDataView,
    chatBackupView,
    starredMessagesView,
    linkedDevicesView,
    languageView,
    wallpaperView,
    translateView,
    loginView,
    messageChatView,
    createGroupView,
    chatWallpaperView,
    chatColorView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.onboardingView,
      page: _i4.OnboardingView,
    ),
    _i1.RouteDef(
      Routes.onboardingLanguageView,
      page: _i5.OnboardingLanguageView,
    ),
    _i1.RouteDef(
      Routes.onboardingPhoneView,
      page: _i6.OnboardingPhoneView,
    ),
    _i1.RouteDef(
      Routes.onboardingPhoneOtpView,
      page: _i7.OnboardingPhoneOtpView,
    ),
    _i1.RouteDef(
      Routes.onboardingAlmostDoneView,
      page: _i8.OnboardingAlmostDoneView,
    ),
    _i1.RouteDef(
      Routes.bottomNavBarView,
      page: _i9.BottomNavBarView,
    ),
    _i1.RouteDef(
      Routes.settingsView,
      page: _i10.SettingsView,
    ),
    _i1.RouteDef(
      Routes.updateView,
      page: _i11.UpdateView,
    ),
    _i1.RouteDef(
      Routes.callView,
      page: _i12.CallView,
    ),
    _i1.RouteDef(
      Routes.chatView,
      page: _i13.ChatView,
    ),
    _i1.RouteDef(
      Routes.contactView,
      page: _i14.ContactView,
    ),
    _i1.RouteDef(
      Routes.walletView,
      page: _i15.WalletView,
    ),
    _i1.RouteDef(
      Routes.addCardView,
      page: _i16.AddCardView,
    ),
    _i1.RouteDef(
      Routes.sendView,
      page: _i17.SendView,
    ),
    _i1.RouteDef(
      Routes.sendPinView,
      page: _i18.SendPinView,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i19.ProfileView,
    ),
    _i1.RouteDef(
      Routes.privacyView,
      page: _i20.PrivacyView,
    ),
    _i1.RouteDef(
      Routes.notificationsView,
      page: _i21.NotificationsView,
    ),
    _i1.RouteDef(
      Routes.storageView,
      page: _i22.StorageView,
    ),
    _i1.RouteDef(
      Routes.storageAndDataView,
      page: _i23.StorageAndDataView,
    ),
    _i1.RouteDef(
      Routes.chatBackupView,
      page: _i24.ChatBackupView,
    ),
    _i1.RouteDef(
      Routes.starredMessagesView,
      page: _i25.StarredMessagesView,
    ),
    _i1.RouteDef(
      Routes.linkedDevicesView,
      page: _i26.LinkedDevicesView,
    ),
    _i1.RouteDef(
      Routes.languageView,
      page: _i27.LanguageView,
    ),
    _i1.RouteDef(
      Routes.wallpaperView,
      page: _i28.WallpaperView,
    ),
    _i1.RouteDef(
      Routes.translateView,
      page: _i29.TranslateView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i30.LoginView,
    ),
    _i1.RouteDef(
      Routes.messageChatView,
      page: _i31.MessageChatView,
    ),
    _i1.RouteDef(
      Routes.createGroupView,
      page: _i32.CreateGroupView,
    ),
    _i1.RouteDef(
      Routes.chatWallpaperView,
      page: _i33.ChatWallpaperView,
    ),
    _i1.RouteDef(
      Routes.chatColorView,
      page: _i34.ChatColorView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.OnboardingView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.OnboardingView(),
        settings: data,
      );
    },
    _i5.OnboardingLanguageView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.OnboardingLanguageView(),
        settings: data,
      );
    },
    _i6.OnboardingPhoneView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.OnboardingPhoneView(),
        settings: data,
      );
    },
    _i7.OnboardingPhoneOtpView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.OnboardingPhoneOtpView(),
        settings: data,
      );
    },
    _i8.OnboardingAlmostDoneView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.OnboardingAlmostDoneView(),
        settings: data,
      );
    },
    _i9.BottomNavBarView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.BottomNavBarView(),
        settings: data,
      );
    },
    _i10.SettingsView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.SettingsView(),
        settings: data,
      );
    },
    _i11.UpdateView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.UpdateView(),
        settings: data,
      );
    },
    _i12.CallView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.CallView(),
        settings: data,
      );
    },
    _i13.ChatView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.ChatView(),
        settings: data,
      );
    },
    _i14.ContactView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.ContactView(),
        settings: data,
      );
    },
    _i15.WalletView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.WalletView(),
        settings: data,
      );
    },
    _i16.AddCardView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.AddCardView(),
        settings: data,
      );
    },
    _i17.SendView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i17.SendView(),
        settings: data,
      );
    },
    _i18.SendPinView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i18.SendPinView(),
        settings: data,
      );
    },
    _i19.ProfileView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i19.ProfileView(),
        settings: data,
      );
    },
    _i20.PrivacyView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i20.PrivacyView(),
        settings: data,
      );
    },
    _i21.NotificationsView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i21.NotificationsView(),
        settings: data,
      );
    },
    _i22.StorageView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i22.StorageView(),
        settings: data,
      );
    },
    _i23.StorageAndDataView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i23.StorageAndDataView(),
        settings: data,
      );
    },
    _i24.ChatBackupView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i24.ChatBackupView(),
        settings: data,
      );
    },
    _i25.StarredMessagesView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i25.StarredMessagesView(),
        settings: data,
      );
    },
    _i26.LinkedDevicesView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i26.LinkedDevicesView(),
        settings: data,
      );
    },
    _i27.LanguageView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i27.LanguageView(),
        settings: data,
      );
    },
    _i28.WallpaperView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i28.WallpaperView(),
        settings: data,
      );
    },
    _i29.TranslateView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i29.TranslateView(),
        settings: data,
      );
    },
    _i30.LoginView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i30.LoginView(),
        settings: data,
      );
    },
    _i31.MessageChatView: (data) {
      final args = data.getArgs<MessageChatViewArguments>(nullOk: false);
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => _i31.MessageChatView(args.userId, key: args.key),
        settings: data,
      );
    },
    _i32.CreateGroupView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i32.CreateGroupView(),
        settings: data,
      );
    },
    _i33.ChatWallpaperView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i33.ChatWallpaperView(),
        settings: data,
      );
    },
    _i34.ChatColorView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i34.ChatColorView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class MessageChatViewArguments {
  const MessageChatViewArguments({
    required this.userId,
    this.key,
  });

  final String userId;

  final _i35.Key? key;

  @override
  String toString() {
    return '{"userId": "$userId", "key": "$key"}';
  }

  @override
  bool operator ==(covariant MessageChatViewArguments other) {
    if (identical(this, other)) return true;
    return other.userId == userId && other.key == key;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ key.hashCode;
  }
}

extension NavigatorStateExtension on _i36.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnboardingLanguageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboardingLanguageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnboardingPhoneView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboardingPhoneView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnboardingPhoneOtpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboardingPhoneOtpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnboardingAlmostDoneView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboardingAlmostDoneView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBottomNavBarView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.bottomNavBarView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSettingsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.settingsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUpdateView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.updateView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCallView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.callView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChatView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.chatView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToContactView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.contactView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWalletView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.walletView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddCardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.addCardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSendView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.sendView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSendPinView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.sendPinView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPrivacyView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.privacyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNotificationsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.notificationsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStorageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.storageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStorageAndDataView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.storageAndDataView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChatBackupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.chatBackupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStarredMessagesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.starredMessagesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLinkedDevicesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.linkedDevicesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLanguageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.languageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWallpaperView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.wallpaperView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTranslateView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.translateView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMessageChatView({
    required String userId,
    _i35.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.messageChatView,
        arguments: MessageChatViewArguments(userId: userId, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateGroupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.createGroupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChatWallpaperView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.chatWallpaperView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChatColorView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.chatColorView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnboardingLanguageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onboardingLanguageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnboardingPhoneView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onboardingPhoneView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnboardingPhoneOtpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onboardingPhoneOtpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnboardingAlmostDoneView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onboardingAlmostDoneView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBottomNavBarView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.bottomNavBarView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSettingsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.settingsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUpdateView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.updateView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCallView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.callView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChatView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.chatView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithContactView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.contactView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithWalletView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.walletView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddCardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.addCardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSendView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.sendView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSendPinView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.sendPinView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPrivacyView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.privacyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNotificationsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.notificationsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStorageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.storageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStorageAndDataView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.storageAndDataView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChatBackupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.chatBackupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStarredMessagesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.starredMessagesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLinkedDevicesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.linkedDevicesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLanguageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.languageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithWallpaperView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.wallpaperView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTranslateView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.translateView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMessageChatView({
    required String userId,
    _i35.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.messageChatView,
        arguments: MessageChatViewArguments(userId: userId, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCreateGroupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.createGroupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChatWallpaperView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.chatWallpaperView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChatColorView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.chatColorView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
