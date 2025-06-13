import 'package:quiick_chat/app/app.locator.dart';
import 'package:quiick_chat/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class WalletViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void navigateToAddCard() {
    _navigationService.navigateTo(Routes.addCardView);
  }
}
