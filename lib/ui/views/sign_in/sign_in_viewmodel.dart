import 'package:gameslist/app/app.locator.dart';
import 'package:gameslist/app/app.router.dart';
import 'package:gameslist/services/authentication_service.dart';
import 'package:gameslist/ui/views/sign_in/sign_in_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignInViewModel extends FormViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  bool isPasswordVisible = false;

  Future signIn() async {
    if (validate()) {
      await _authenticationService.signIn(emailValue!, passwordValue!);
      await _navigationService.clearStackAndShow(Routes.mainView);
    }
  }

  bool validate() {
    return emailValue != null && passwordValue != null;
  }

  void navigateToSignUp() {
    _navigationService.replaceWithSignUpView();
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }
}
