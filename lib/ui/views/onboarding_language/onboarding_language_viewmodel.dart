import 'package:quiick_chat/app/app.bottomsheets.dart';
import 'package:quiick_chat/app/app.locator.dart';
import 'package:quiick_chat/app/app.logger.dart';
import 'package:quiick_chat/app/app.router.dart';
import 'package:quiick_chat/repository/export.dart';
import 'package:quiick_chat/services/auth_data_store_service.dart';
import 'package:quiick_chat/services/export.dart';
import 'package:quiick_chat/utils/countries_data.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardingLanguageViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _authService = locator<IAuthService>();
  final _loadingService = locator<LoadingService>();
  final _authDataStoreService = locator<AuthDataStoreService>();
  final _toastService = locator<ToastService>();
  final logger = getLogger('OnboardingLanguageViewModel');

  void back() {
    _navigationService.back();
  }

  void next() {
    _navigationService.navigateTo(Routes.onboardingAlmostDoneView);
  }

  CountryData? _selectedCountry = const CountryData(
    name: "Canada",
    code: "CA",
    dialCode: "+1",
    languages: ["English", "French"],
  );
  CountryData? get selectedCountry => _selectedCountry;
  void setselectedCountry(CountryData? country) {
    _selectedCountry = country;
    notifyListeners();
  }

  List<CountryData> get countries => CountriesData.allCountries;

  void showCountries() async {
    final result = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.countries,
      data: countries,
      title: "Select a country",
      mainButtonTitle: "Done",
      secondaryButtonTitle: "Cancel",
    );
    if (result == null) return;
    setselectedCountry(result.data);
    print(_selectedCountry!.name);
  }

  // Future<void> login() async {
  //   try {
  //     _loadingService.showLoading(loadingText: "Logging in...");
  //     final res = await _authService.login(phone: _authDataStoreService.phone!);
  //     if (res.isSuccess) {
  //       next();
  //     } else {
  //       _toastService.handleFailure(res.failure, context: "Login Failed");
  //     }
  //   } catch (e) {
  //     logger.e(e);
  //     _toastService.showError(
  //       'Error',
  //       'Login Failed',
  //     );
  //   } finally {
  //     _loadingService.hideLoading();
  //   }
  // }
}
