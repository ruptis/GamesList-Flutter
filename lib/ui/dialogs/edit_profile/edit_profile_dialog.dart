import 'package:flutter/material.dart';
import 'package:gameslist/model/user.dart';
import 'package:gameslist/ui/dialogs/edit_profile/edit_profile_dialog.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'edit_profile_dialog_model.dart';

const double _graphicSize = 60;

@FormView(fields: [
  FormTextField(name: 'name'),
  FormTextField(name: 'country'),
  FormTextField(name: 'links'),
  FormTextField(name: 'aboutMe'),
])
class EditProfileDialog extends StackedView<EditProfileDialogModel>
    with $EditProfileDialog {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const EditProfileDialog({
    super.key,
    required this.request,
    required this.completer,
  });

  @override
  Widget builder(
    BuildContext context,
    EditProfileDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        insetPadding: const EdgeInsets.all(0),
        backgroundColor: Colors.white,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Edit profile'),
            centerTitle: true,
            leading: TextButton(
              onPressed: () => completer(DialogResponse(confirmed: false)),
              child: const Text('Cancel'),
            ),
            leadingWidth: 70,
            actions: [
              TextButton(
                onPressed: () async {
                  await viewModel.updateProfile();
                  completer(DialogResponse(confirmed: true));
                },
                child: const Text('Save'),
              ),
            ],
          ),
          body: Container(
            color: Theme.of(context).colorScheme.surfaceVariant,
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildSection(context,
                      title: 'Profile picture',
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: CircleAvatar(
                          radius: _graphicSize,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          child: const Icon(
                            Icons.person,
                            size: _graphicSize,
                            color: Colors.white,
                          ),
                        ),
                      )),
                  _buildSection(
                    context,
                    title: 'Personal information',
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Name'),
                          controller: nameController,
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Country'),
                          controller: countryController,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Links'),
                          controller: linksController,
                        ),
                      ],
                    ),
                  ),
                  _buildSection(
                    context,
                    title: 'About me',
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'About me'),
                      maxLines: 5,
                      controller: aboutMeController,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Padding _buildSection(BuildContext context, {String? title, Widget? child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (title != null)
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            if (child != null) child,
          ],
        ),
      ),
    );
  }

  @override
  EditProfileDialogModel viewModelBuilder(BuildContext context) =>
      EditProfileDialogModel(request.data as User);

  @override
  void onViewModelReady(EditProfileDialogModel viewModel) {
    super.onViewModelReady(viewModel);
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(EditProfileDialogModel viewModel) {
    nameController.dispose();
    countryController.dispose();
    linksController.dispose();
    aboutMeController.dispose();
    super.onDispose(viewModel);
  }
}
