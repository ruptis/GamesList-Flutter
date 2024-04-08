import 'package:flutter/material.dart';
import 'package:gameslist/screens/welcome/welcome_screen.dart';

class GamesListApp extends StatelessWidget {
  const GamesListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WelcomeScreen()
    );
  }
}