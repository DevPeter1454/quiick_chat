import 'package:quiick_chat/app/app.locator.dart';
import 'package:quiick_chat/app/app.router.dart';
import 'package:quiick_chat/ui/common/export.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardingViewModel extends IndexTrackingViewModel {
  final _navigationService = locator<NavigationService>();

  void navigateToOnboardingPhone() {
    _navigationService.navigateTo(Routes.onboardingPhoneView);
  }

  // Define your ViewModel state and methods here.
  final List<String> _onboardingImages = [
    AppSvgs.onboardA,
    AppSvgs.onboardB,
    AppSvgs.onboardC,
  ];
  final List<String> _onboardingTitles = [
    "Quiickchat\none app, Effortless communication",
    "Connect anytime, anywhere",
    "Global Chat",
  ];
  final List<String> _onboardingSubtitles = [
    "Select your language and chat online or offline with friends, family, or colleagues.",
    "Enjoy private messaging, voice, and video calls with built-in security and privacy controls.",
    "Talk to anyone, anywhere. Chat, call, and share with people worldwide—no language barriers, no limits."
  ];
  List<String> get onboardingImages => _onboardingImages;
  List<String> get onboardingTitles => _onboardingTitles;
  List<String> get onboardingSubtitles => _onboardingSubtitles;
}
