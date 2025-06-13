import 'package:quiick_chat/app/app.locator.dart';
import 'package:quiick_chat/app/app.logger.dart';
import 'package:quiick_chat/app/app.router.dart';
import 'package:quiick_chat/repository/export.dart';
import 'package:quiick_chat/services/auth_data_store_service.dart';
import 'package:quiick_chat/services/export.dart';
import 'package:quiick_chat/ui/views/onboarding_phone_otp/onboarding_phone_otp_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardingPhoneOtpViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<IAuthService>();
  final _loadingService = locator<LoadingService>();
  final _toastService = locator<ToastService>();
  final _authDataStoreService = locator<AuthDataStoreService>();
  final logger = getLogger('OnboardingPhoneOtpViewModel');

  void back() {
    _navigationService.back();
  }

  void navigateToLanguageSelection() {
    _navigationService.navigateTo(Routes.onboardingLanguageView);
  }

  Future<void> verifyPhoneNumber() async {
    logger.d("isform valid: $isFormValid");
    if (!isFormValid) {
      _toastService.showError(
        'Error',
        codeValidationMessage!,
      );
      return;
    }
    try {
      _loadingService.showLoading(loadingText: "Verifying phone number...");
      final res = await _authService.verifyPhoneNumber(
          phone: _authDataStoreService.phone!, code: codeValue!);
      logger.d(res.success);
      if (res.success) {
        _toastService.showSuccess(
          'Success',
          'Phone number verified successfully',
        );
        navigateToLanguageSelection();
      } else {
        logger.e(res.failure);
        _toastService.handleFailure(res.failure,
            context: "Otp Verification Failed");
      }
    } catch (e) {
      logger.e(e);
      _toastService.showError(
        'Error',
        'Otp Verification Failed',
      );
    } finally {
      _loadingService.hideLoading();
    }
  }

  Future<void> resendOtp() async {
    try {
      _loadingService.showLoading(loadingText: "Resending otp...");
      final res =
          await _authService.resendOtp(phone: _authDataStoreService.phone!);
      if (res.success) {
        final code = res.getField("code");
        logger.d("code: $code");
        _toastService.showSuccess(
          'Success',
          'Otp resent successfully. Use the code: $code',
        );
      } else {
        _toastService.handleFailure(res.failure, context: "Otp resend Failed");
      }
    } catch (e) {
      logger.e(e);
      _toastService.showError(
        'Error',
        'Otp resend Failed',
      );
    } finally {
      _loadingService.hideLoading();
    }
  }
}
