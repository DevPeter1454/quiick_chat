import 'package:quiick_chat/repository/export.dart';
import 'package:quiick_chat/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:quiick_chat/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:quiick_chat/ui/views/home/home_view.dart';
import 'package:quiick_chat/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:quiick_chat/ui/views/onboarding/onboarding_view.dart';
import 'package:quiick_chat/ui/views/onboarding_language/onboarding_language_view.dart';
import 'package:quiick_chat/ui/views/onboarding_phone/onboarding_phone_view.dart';
import 'package:quiick_chat/ui/dialogs/number_confirmation/number_confirmation_dialog.dart';
import 'package:quiick_chat/ui/bottom_sheets/countries/countries_sheet.dart';
import 'package:quiick_chat/ui/views/onboarding_phone_otp/onboarding_phone_otp_view.dart';
import 'package:quiick_chat/ui/views/onboarding_almost_done/onboarding_almost_done_view.dart';
import 'package:quiick_chat/services/api_service.dart';
import 'package:quiick_chat/services/toast_service.dart';
import 'package:quiick_chat/services/loading_service.dart';
import 'package:quiick_chat/services/auth_data_store_service.dart';
import 'package:quiick_chat/ui/views/bottom_nav_bar/bottom_nav_bar_view.dart';
import 'package:quiick_chat/services/local_storage_service.dart';
import 'package:quiick_chat/ui/views/settings/settings_view.dart';
import 'package:quiick_chat/ui/views/update/update_view.dart';
import 'package:quiick_chat/ui/views/call/call_view.dart';
import 'package:quiick_chat/ui/views/chat/chat_view.dart';
import 'package:quiick_chat/ui/views/contact/contact_view.dart';
import 'package:quiick_chat/ui/views/settings/pages/wallet/wallet_view.dart';
import 'package:quiick_chat/ui/views/settings/pages/add_card/add_card_view.dart';
import 'package:quiick_chat/ui/views/settings/pages/send/send_view.dart';
import 'package:quiick_chat/ui/views/settings/pages/send_pin/send_pin_view.dart';
import 'package:quiick_chat/ui/views/settings/pages/profile/profile_view.dart';
import 'package:quiick_chat/ui/views/settings/pages/privacy/privacy_view.dart';
import 'package:quiick_chat/ui/views/settings/pages/notifications/notifications_view.dart';
import 'package:quiick_chat/ui/views/settings/pages/storage/storage_view.dart';
import 'package:quiick_chat/ui/views/settings/pages/storage_and_data/storage_and_data_view.dart';
import 'package:quiick_chat/ui/views/settings/pages/chat_backup/chat_backup_view.dart';
import 'package:quiick_chat/ui/views/settings/pages/starred_messages/starred_messages_view.dart';
import 'package:quiick_chat/ui/views/settings/pages/linked_devices/linked_devices_view.dart';
import 'package:quiick_chat/ui/views/settings/pages/language/language_view.dart';
import 'package:quiick_chat/ui/views/settings/pages/wallpaper/wallpaper_view.dart';
import 'package:quiick_chat/ui/views/settings/pages/translate/translate_view.dart';
import 'package:quiick_chat/ui/views/login/login_view.dart';
import 'package:quiick_chat/ui/dialogs/code_input/code_input_dialog.dart';
import 'package:quiick_chat/ui/dialogs/add_contact/add_contact_dialog.dart';
import 'package:quiick_chat/ui/views/message_chat/message_chat_view.dart';
import 'package:quiick_chat/ui/dialogs/file/file_dialog.dart';
import 'package:quiick_chat/ui/dialogs/preview/preview_dialog.dart';
import 'package:quiick_chat/ui/views/create_group/create_group_view.dart';
import 'package:quiick_chat/ui/views/chat_wallpaper/chat_wallpaper_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: OnboardingView),
    MaterialRoute(page: OnboardingLanguageView),
    MaterialRoute(page: OnboardingPhoneView),
    MaterialRoute(page: OnboardingPhoneOtpView),
    MaterialRoute(page: OnboardingAlmostDoneView),
    MaterialRoute(page: BottomNavBarView),
    MaterialRoute(page: SettingsView),
    MaterialRoute(page: UpdateView),
    MaterialRoute(page: CallView),
    MaterialRoute(page: ChatView),
    MaterialRoute(page: ContactView),
    MaterialRoute(page: WalletView),
    MaterialRoute(page: AddCardView),
    MaterialRoute(page: SendView),
    MaterialRoute(page: SendPinView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: PrivacyView),
    MaterialRoute(page: NotificationsView),
    MaterialRoute(page: StorageView),
    MaterialRoute(page: StorageAndDataView),
    MaterialRoute(page: ChatBackupView),
    MaterialRoute(page: StarredMessagesView),
    MaterialRoute(page: LinkedDevicesView),
    MaterialRoute(page: LanguageView),
    MaterialRoute(page: WallpaperView),
    MaterialRoute(page: TranslateView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: MessageChatView),
    MaterialRoute(page: CreateGroupView),
    MaterialRoute(page: ChatWallpaperView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ToastService),
    LazySingleton(classType: LoadingService),
    LazySingleton(asType: IAuthService, classType: AuthServiceImpl),
    LazySingleton(asType: IAgoraService, classType: AgoraServiceImpl),

    LazySingleton(classType: AuthDataStoreService),
    // Change the LocalStorageService registration to use a factory
    InitializableSingleton(classType: LocalStorageService),
    LazySingleton(classType: ApiService),

// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: CountriesSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: NumberConfirmationDialog),
    StackedDialog(classType: CodeInputDialog),
    StackedDialog(classType: AddContactDialog),
    StackedDialog(classType: FileDialog),
    StackedDialog(classType: PreviewDialog),
// @stacked-dialog
  ],

  //logger
  logger: StackedLogger(),
)
class App {}
