import 'package:flutter/material.dart';
import 'package:quiick_chat/app/app.bottomsheets.dart';
import 'package:quiick_chat/app/app.dialogs.dart';
import 'package:quiick_chat/app/app.locator.dart';
import 'package:quiick_chat/app/app.router.dart';
import 'package:quiick_chat/services/export.dart';
import 'package:quiick_chat/ui/common/export.dart';
import 'package:quiick_chat/ui/widgets/common/loading_manager.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:agora_chat_uikit/chat_uikit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  final options = ChatOptions(
      appKey: "411297342#1528399",
      autoLogin: false,
      acceptInvitationAlways: true,
      messagesReceiveCallbackIncludeSend: true);
  await ChatClient.getInstance.init(options).then((value) async {
    runApp(const MainApp());
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: LoadingManager(
          child: MaterialApp(
            scaffoldMessengerKey: rootScaffoldMessengerKey,
            initialRoute: Routes.startupView,
            onGenerateRoute: StackedRouter().onGenerateRoute,
            navigatorKey: StackedService.navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(scaffoldBackgroundColor: AppColors.kcWhiteColor),
            navigatorObservers: [
              StackedService.routeObserver,
            ],
          ),
        ),
      ),
    );
  }
}
