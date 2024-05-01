import 'package:gameslist/app/app.locator.dart';
import 'package:gameslist/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class WelcomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  navigateToSignIn() {
    _navigationService.navigateToSignInView();
  }

  navigateToSignUp() {
    _navigationService.navigateToSignUpView();
  }
}
