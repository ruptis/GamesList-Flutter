import 'package:flutter/material.dart';
import 'package:gameslist/model/status.dart';
import 'package:gameslist/ui/common/game_card_view.dart';
import 'package:gameslist/ui/common/games_list_view.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:stacked/stacked.dart';

import 'collection_viewmodel.dart';

class CollectionView extends StackedView<CollectionViewModel> {
  const CollectionView({super.key});

  @override
  Widget builder(
    BuildContext context,
    CollectionViewModel viewModel,
    Widget? child,
  ) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Text('Collection'),
          centerTitle: true,
          bottom: const TabBar.secondary(tabs: [
            Tab(icon: Icon(Symbols.sports_esports_rounded)),
            Tab(icon: Icon(Symbols.nest_clock_farsight_analog_rounded)),
            Tab(icon: Icon(Symbols.check_circle_rounded)),
            Tab(icon: Icon(Symbols.stop_circle_rounded)),
          ]),
        ),
        body: TabBarView(
          children: [
            _buildTab(context, viewModel, Status.playing),
            _buildTab(context, viewModel, Status.planning),
            _buildTab(context, viewModel, Status.passed),
            _buildTab(context, viewModel, Status.abandoned),
          ],
        ),
      ),
    );
  }

  @override
  CollectionViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CollectionViewModel();

  Widget _buildTab(
      BuildContext context, CollectionViewModel viewModel, Status status) {
    if (viewModel.data == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return GamesListView(
          games:
              viewModel.data!.where((game) => game.status == status).toList(),
          listItem: (game) => GameCardView(
              game: game,
              onTap: () => viewModel.onGameSelected(game),
              onToggleStatus: (status) =>
                  viewModel.onToggleStatus(game, status)));
    }
  }
}
