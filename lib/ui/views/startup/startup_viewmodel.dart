import 'package:firebase_core/firebase_core.dart';
import 'package:gameslist/app/app.locator.dart';
import 'package:gameslist/app/app.router.dart';
import 'package:gameslist/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future runStartupLogic() async {
    await Firebase.initializeApp();

    var hasLoggedInUser = locator<AuthenticationService>().isUserLoggedIn;

    if (hasLoggedInUser) {
      _navigationService.replaceWithMainView();
    } else {
      _navigationService.replaceWithWelcomeView();
    }
  }
}
