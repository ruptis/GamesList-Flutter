// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/edit_profile/edit_profile_dialog.dart';

enum DialogType {
  editProfile,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.editProfile: (context, request, completer) =>
        EditProfileDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
