import 'package:gameslist/app/app.locator.dart';
import 'package:gameslist/model/user.dart';
import 'package:gameslist/services/user_service.dart';
import 'package:gameslist/ui/dialogs/edit_profile/edit_profile_dialog.form.dart';
import 'package:stacked/stacked.dart';

class EditProfileDialogModel extends FormViewModel {
  final _userService = locator<UserService>();
  User user;

  EditProfileDialogModel(this.user) {
    nameValue = user.name;
    countryValue = user.country;
    linksValue = user.links;
    aboutMeValue = user.bio;
  }

  Future<void> updateProfile() async {
    var updatedUser = user.copyWith(
      name: nameValue,
      country: countryValue,
      links: linksValue,
      bio: aboutMeValue,
    );
    await _userService.updateUser(updatedUser);
  }
}
