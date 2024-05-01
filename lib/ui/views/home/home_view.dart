import 'package:flutter/material.dart';
import 'package:gameslist/ui/common/game_card_view.dart';
import 'package:gameslist/ui/common/games_list_view.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Text('Games List'),
          centerTitle: true,
        ),
        body: GamesListView(
            games: viewModel.data ?? [],
            listItem: (game) => GameCardView(
                game: game,
                onTap: () => viewModel.onCardTap(game),
                onToggleStatus: (status) =>
                    viewModel.onToggleStatus(game, status))));
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
