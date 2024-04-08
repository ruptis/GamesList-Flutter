import 'package:flutter/material.dart';
import 'package:gameslist/app/games_list_app.dart';
import 'package:gameslist/app/locator_configuration.dart';

void main() {
  setupDependencies();
  runApp(const GamesListApp());
}
