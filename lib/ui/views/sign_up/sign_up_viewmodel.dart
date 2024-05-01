import 'package:gameslist/app/app.locator.dart';
import 'package:gameslist/app/app.router.dart';
import 'package:gameslist/services/authentication_service.dart';
import 'package:gameslist/ui/views/sign_up/sign_up_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends FormViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  bool isPasswordVisible = false;

  Future signUp() async {
    if (validate()) {
      await _authenticationService.signUp(
          emailValue!, nameValue!, passwordValue!);
      await _navigationService.clearStackAndShow(Routes.mainView);
    }
  }

  bool validate() {
    return emailValue != null && passwordValue != null && nameValue != null;
  }

  void navigateToSignIn() {
    _navigationService.replaceWithSignInView();
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }
}
