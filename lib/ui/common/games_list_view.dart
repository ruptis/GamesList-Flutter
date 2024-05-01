import 'package:flutter/material.dart';
import 'package:gameslist/model/game.dart';

class GamesListView extends StatelessWidget {
  const GamesListView({super.key, required this.games, required this.listItem});

  final List<Game> games;
  final Widget Function(Game) listItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView.builder(
        itemCount: games.length,
        itemBuilder: (context, index) {
          final game = games[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: listItem(game),
          );
        },
      ),
    );
  }
}
