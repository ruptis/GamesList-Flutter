import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gameslist/model/game.dart';
import 'package:gameslist/model/status.dart';
import 'package:gameslist/ui/common/game_actions_view.dart';
import 'package:gameslist/ui/common/tags_row.dart';

class GameCardView extends StatelessWidget {
  const GameCardView(
      {super.key,
      required this.game,
      required this.onTap,
      required this.onToggleStatus});

  final Game game;
  final Function() onTap;
  final Function(Status) onToggleStatus;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: SizedBox(
      height: 160,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(imageUrl: game.cover, width: 120),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(game.title,
                        style: Theme.of(context).textTheme.headlineSmall,
                        overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 6),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TagsRow(
                            tags: game.platforms
                                .map((e) => e.abbreviation)
                                .toList()),
                        const SizedBox(height: 6),
                        TagsRow(tags: game.genres),
                      ],
                    ),
                    GameActionsView(
                        status: game.status, onToggleStatus: onToggleStatus)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
