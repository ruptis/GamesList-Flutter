import 'package:gameslist/app/app.dialogs.dart';
import 'package:gameslist/app/app.locator.dart';
import 'package:gameslist/app/app.logger.dart';
import 'package:gameslist/app/app.router.dart';
import 'package:gameslist/model/user.dart';
import 'package:gameslist/services/authentication_service.dart';
import 'package:gameslist/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends StreamViewModel<User> {
  final logger = getLogger('ProfileViewModel');
  final _userService = locator<UserService>();
  final _authenticationService = locator<AuthenticationService>();
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  @override
  Stream<User> get stream {
    var userId = _authenticationService.getUserId();
    if (userId != null) {
      logger.i('User ID: $userId');
      return _userService.getUser(userId).map((user) {
        logger.i('User: ${user != null}');
        if (user == null) {
          throw Exception('User not found');
        }
        return user;
      });
    } else {
      throw Exception('User not authenticated');
    }
  }

  Future<void> onSignOut() async {
    await _authenticationService.signOut();
    await _navigationService.replaceWithWelcomeView();
  }

  Future<void> onEditProfile() async {
    var result = await _dialogService.showCustomDialog(
        variant: DialogType.editProfile, data: data);
    if (result != null) {
      notifyListeners();
    }
  }
}
