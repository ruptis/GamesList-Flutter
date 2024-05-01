import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gameslist/ui/common/game_actions_view.dart';
import 'package:stacked/stacked.dart';

import 'game_details_viewmodel.dart';

class GameDetailsView extends StackedView<GameDetailsViewModel> {
  const GameDetailsView(this.gameId, {super.key});

  final String gameId;

  @override
  Widget builder(
    BuildContext context,
    GameDetailsViewModel viewModel,
    Widget? child,
  ) =>
      Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(title: const Text('Game details')),
          body: _buildDetails(context, viewModel));

  @override
  GameDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      GameDetailsViewModel(gameId);

  Widget _buildDetails(BuildContext context, GameDetailsViewModel viewModel) {
    if (viewModel.data == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return ListView(
        children: [
          _buildGameImage(viewModel.data!.cover),
          const SizedBox(height: 20),
          _buildTitleSection(context, viewModel),
          const Divider(),
          _buildInfoSection(context, viewModel),
          const Divider(),
          _buildDescriptionSection(context, viewModel),
          const Divider(),
          _buildScreenshotsSection(context, viewModel),
        ],
      );
    }
  }

  Widget _buildGameImage(String imageUrl) => ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          height: 300,
          fit: BoxFit.cover,
        ),
      );

  Widget _buildTitleSection(
          BuildContext context, GameDetailsViewModel viewModel) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(viewModel.data!.title,
                style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 10),
            GameActionsView(
                status: viewModel.data!.status,
                onToggleStatus: (status) => viewModel.onToggleStatus(status))
          ],
        ),
      );

  Widget _buildInfoSection(
          BuildContext context, GameDetailsViewModel viewModel) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Information',
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 10),
            Text('Developer: ${viewModel.data!.developer}'),
            const SizedBox(height: 3),
            Text('Publisher: ${viewModel.data!.publisher}'),
            const SizedBox(height: 3),
            Text(
                'Release date: ${viewModel.data!.releaseDate.toLocal().toString().split(' ')[0]}'),
            const SizedBox(height: 3),
            Text(
                'Platforms: ${viewModel.data!.platforms.map((e) => e.name).join(', ')}'),
            const SizedBox(height: 3),
            Text('Genres: ${viewModel.data!.genres.join(', ')}'),
          ],
        ),
      );

  Widget _buildDescriptionSection(
          BuildContext context, GameDetailsViewModel viewModel) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Description',
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 10),
            Text(viewModel.data!.description),
          ],
        ),
      );

  Widget _buildScreenshotsSection(
          BuildContext context, GameDetailsViewModel viewModel) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44),
              child: Text('Screenshots',
                  style: Theme.of(context).textTheme.headlineMedium),
            ),
            const SizedBox(height: 10),
            CarouselSlider.builder(
                itemCount: viewModel.data!.screenshots.length,
                itemBuilder: (context, index, realIndex) => _buildScreenshot(
                    context, viewModel.data!.screenshots[index]),
                options: CarouselOptions(
                    height: 200,
                    viewportFraction: 0.8,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    autoPlay: true))
          ],
        ),
      );

  Widget _buildScreenshot(BuildContext context, String imageUrl) => ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.cover,
        ),
      );
}
