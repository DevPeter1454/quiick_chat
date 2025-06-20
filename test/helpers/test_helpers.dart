import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:quiick_chat/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:quiick_chat/services/api_service.dart';
import 'package:quiick_chat/services/toast_service.dart';
import 'package:quiick_chat/services/loading_service.dart';
import 'package:quiick_chat/services/auth_data_store_service.dart';
import 'package:quiick_chat/services/local_storage_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ApiService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ToastService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<LoadingService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<AuthDataStoreService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<LocalStorageService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterApiService();
  getAndRegisterToastService();
  getAndRegisterLoadingService();
  getAndRegisterAuthDataStoreService();
  getAndRegisterLocalStorageService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockApiService getAndRegisterApiService() {
  _removeRegistrationIfExists<ApiService>();
  final service = MockApiService();
  locator.registerSingleton<ApiService>(service);
  return service;
}

MockToastService getAndRegisterToastService() {
  _removeRegistrationIfExists<ToastService>();
  final service = MockToastService();
  locator.registerSingleton<ToastService>(service);
  return service;
}

MockLoadingService getAndRegisterLoadingService() {
  _removeRegistrationIfExists<LoadingService>();
  final service = MockLoadingService();
  locator.registerSingleton<LoadingService>(service);
  return service;
}

MockAuthDataStoreService getAndRegisterAuthDataStoreService() {
  _removeRegistrationIfExists<AuthDataStoreService>();
  final service = MockAuthDataStoreService();
  locator.registerSingleton<AuthDataStoreService>(service);
  return service;
}

MockLocalStorageService getAndRegisterLocalStorageService() {
  _removeRegistrationIfExists<LocalStorageService>();
  final service = MockLocalStorageService();
  locator.registerSingleton<LocalStorageService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
