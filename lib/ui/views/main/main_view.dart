import 'package:flutter/material.dart';
import 'package:gameslist/ui/views/collection/collection_view.dart';
import 'package:gameslist/ui/views/home/home_view.dart';
import 'package:gameslist/ui/views/profile/profile_view.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:stacked/stacked.dart';

import 'main_viewmodel.dart';

class MainView extends StackedView<MainViewModel> {
  const MainView({super.key});

  @override
  Widget builder(
    BuildContext context,
    MainViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(
              icon: Icon(Symbols.home_rounded),
              selectedIcon: Icon(
                Symbols.home_rounded,
                fill: 1.0,
              ),
              label: 'Home',
            ),
            NavigationDestination(
                icon: Icon(Symbols.collections_bookmark_rounded),
                selectedIcon:
                    Icon(Symbols.collections_bookmark_rounded, fill: 1.0),
                label: 'Collection'),
            NavigationDestination(
                icon: Icon(Symbols.account_circle_rounded),
                selectedIcon: Icon(Symbols.account_circle_rounded, fill: 1.0),
                label: 'Profile'),
          ],
          selectedIndex: viewModel.currentIndex,
          onDestinationSelected: viewModel.setIndex,
        ),
        body: [
          const HomeView(),
          const CollectionView(),
          const ProfileView()
        ][viewModel.currentIndex]);
  }

  @override
  MainViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MainViewModel();
}
