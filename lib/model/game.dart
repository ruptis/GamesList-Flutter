import 'dart:core';

import 'package:gameslist/model/platform.dart';
import 'package:gameslist/model/status.dart';

class Game {
  final String id;
  final String title;
  final String developer;
  final String publisher;
  final DateTime releaseDate;
  final List<String> genres;
  final List<Platform> platforms;
  final String description;
  final List<String> screenshots;
  final String cover;
  final Status? status;

  Game(
      {required this.id,
      required this.title,
      required this.developer,
      required this.publisher,
      required this.releaseDate,
      required this.genres,
      required this.platforms,
      required this.description,
      required this.screenshots,
      required this.cover,
      required this.status});
}
