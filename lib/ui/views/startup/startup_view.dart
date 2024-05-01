import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gameslist/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({super.key});

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Games List', style: Theme.of(context).textTheme.titleLarge),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Loading ...',
                    style: Theme.of(context).textTheme.bodyMedium),
                horizontalSpaceSmall,
                const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                    strokeWidth: 6,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
