import 'package:flutter/material.dart';
import 'package:gameslist/ui/common/filled_text_button.dart';
import 'package:stacked/stacked.dart';

import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({super.key});

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildUserProfile(context, viewModel),
              const SizedBox(height: 24),
              _buildProfileActions(context, viewModel),
            ],
          ),
        ),
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileViewModel();

  Widget _buildUserProfile(BuildContext context, ProfileViewModel viewModel) =>
      Column(
        children: [
          Icon(
            Icons.account_circle,
            size: 120,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          const SizedBox(height: 12),
          Text(
            viewModel.data?.name ?? '',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 44),
            child: _buildProfileInfo(context, viewModel),
          )
        ],
      );

  Column _buildProfileInfo(BuildContext context, ProfileViewModel viewModel) =>
      Column(
        children: [
          _buildInfoRow(context, 'Email:', viewModel.data?.email ?? ''),
          _buildInfoRow(context, 'Country:', viewModel.data?.country ?? ''),
          _buildInfoRow(
              context, 'Gender:', viewModel.data?.gender?.value ?? ''),
          _buildInfoRow(
              context,
              'Date of birth:',
              viewModel.data?.dateOfBirth?.toLocal().toString().split(' ')[0] ??
                  ''),
          _buildInfoRow(
              context,
              'Date of registration:',
              viewModel.data?.dateOfRegistration
                      .toLocal()
                      .toString()
                      .split(' ')[0] ??
                  ''),
          _buildInfoRow(context, 'Links:', viewModel.data?.links ?? ''),
          _buildInfoRow(context, 'Games in collection:',
              viewModel.data?.gamesCount.toString() ?? ''),
          _buildInfoRow(context, 'Passed games:',
              viewModel.data?.passedGamesCount.toString() ?? ''),
          const SizedBox(height: 16),
          Text('About me:', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 6),
          Text(
            viewModel.data?.bio ?? '',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      );

  Widget _buildInfoRow(BuildContext context, String label, String value) => Row(
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant),
          ),
          const SizedBox(width: 6),
          Text(
            value,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
        ],
      );

  Widget _buildProfileActions(
          BuildContext context, ProfileViewModel viewModel) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 56.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FilledTextButton(
                text: 'Edit profile', onPressed: viewModel.onEditProfile),
            const SizedBox(height: 12),
            FilledTextButton(text: 'Sign out', onPressed: viewModel.onSignOut),
          ],
        ),
      );
}
