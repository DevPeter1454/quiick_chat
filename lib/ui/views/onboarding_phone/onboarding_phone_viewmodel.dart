import 'package:flutter/material.dart';
import 'package:quiick_chat/app/app.bottomsheets.dart';
import 'package:quiick_chat/app/app.dialogs.dart';
import 'package:quiick_chat/app/app.locator.dart';
import 'package:quiick_chat/app/app.logger.dart';
import 'package:quiick_chat/app/app.router.dart';
import 'package:quiick_chat/repository/export.dart';
import 'package:quiick_chat/services/auth_data_store_service.dart';
import 'package:quiick_chat/services/export.dart';
import 'package:quiick_chat/ui/views/onboarding_phone/onboarding_phone_view.form.dart';
import 'package:quiick_chat/utils/countries_data.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardingPhoneViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();
  final _authService = locator<IAuthService>();
  final _authDataStoreService = locator<AuthDataStoreService>();
  final _loadingService = locator<LoadingService>();
  final _toastService = locator<ToastService>();
  final logger = getLogger('OnboardingPhoneViewModel');

  void back() {
    _navigationService.back();
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

  void showNumberConfirmationDialog() async {
    if (!isFormValid) {
      _toastService.showError("Error", phoneNumberValidationMessage!);
      return;
      // _toastService
    }
    final result = await _dialogService.showCustomDialog(
      variant: DialogType.numberConfirmation,
      barrierColor: const Color(0xFFD9F8E8).withOpacity(0.8),
      data: "${_selectedCountry!.dialCode} $phoneNumberValue",
    );

    if (result == null || !result.confirmed) return;
    if (result.confirmed) {
      await registerUser();
      // _navigationService.navigateTo(Routes.onboardingPhoneOtpView);
    }
  }

  Future<void> registerUser() async {
    try {
      _loadingService.showLoading(loadingText: 'Please wait...');
      _authDataStoreService
          .setPhone("${_selectedCountry!.dialCode}$phoneNumberValue");
      final res = await _authService.register(
          phone: "${_selectedCountry!.dialCode}$phoneNumberValue");
      if (res.isSuccess) {
        _toastService.showSuccess("Success", "User registered successfully");
        _authDataStoreService
            .setPhone("${_selectedCountry!.dialCode}$phoneNumberValue");

        _navigationService.navigateTo(Routes.onboardingPhoneOtpView);
      } else {
        logger.e(res.failure!.runtimeType);
        _toastService.handleFailure(res.failure,
            context: "Registration Failed");
        if (res.failure!.message == "User already exists") {
          _navigationService.navigateTo(Routes.onboardingLanguageView);
        }
      }
    } finally {
      _loadingService.hideLoading();
    }
  }

  //
}

//universal phone number validator without country code
