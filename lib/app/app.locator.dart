// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../repository/agora_repository/agora_service.dart';
import '../repository/agora_repository/agora_service_impl.dart';
import '../repository/auth_repository/auth_service.dart';
import '../repository/auth_repository/auth_service_impl.dart';
import '../services/api_service.dart';
import '../services/auth_data_store_service.dart';
import '../services/loading_service.dart';
import '../services/local_storage_service.dart';
import '../services/toast_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ToastService());
  locator.registerLazySingleton(() => LoadingService());
  locator.registerLazySingleton<IAuthService>(() => AuthServiceImpl());
  locator.registerLazySingleton<IAgoraService>(() => AgoraServiceImpl());
  locator.registerLazySingleton(() => AuthDataStoreService());
  final localStorageService = LocalStorageService();
  await localStorageService.init();
  locator.registerSingleton(localStorageService);

  locator.registerLazySingleton(() => ApiService());
}
