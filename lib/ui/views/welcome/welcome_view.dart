import 'package:flutter/material.dart';
import 'package:gameslist/ui/common/filled_text_button.dart';
import 'package:stacked/stacked.dart';

import 'welcome_viewmodel.dart';

class WelcomeView extends StackedView<WelcomeViewModel> {
  const WelcomeView({super.key});

  @override
  Widget builder(
    BuildContext context,
    WelcomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildLogo(context),
            const SizedBox(height: 64),
            buildButtons(context, viewModel),
          ],
        ),
      ),
    );
  }

  Column buildLogo(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.sports_esports,
            size: 100,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 20),
          Text(
            'Games List',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      );

  Text buildTitle(BuildContext context) => Text(
        'Welcome to Games List',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      );

  Icon buildIcon(BuildContext context) => Icon(
        Icons.gamepad,
        size: 100,
        color: Theme.of(context).colorScheme.primary,
      );

  Column buildButtons(BuildContext context, WelcomeViewModel viewModel) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FilledTextButton(
              text: "Sign In", onPressed: viewModel.navigateToSignIn),
          const SizedBox(height: 16),
          FilledTextButton(
              text: "Sign Up", onPressed: viewModel.navigateToSignUp),
        ],
      );

  @override
  WelcomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WelcomeViewModel();
}
