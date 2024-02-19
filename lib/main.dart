import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird_app/game/flappy_game.dart';
import 'package:flappy_bird_app/screens/game_over.dart';
import 'package:flappy_bird_app/screens/main_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();

  final game = FlappyBirdGame();
  runApp(
    GameWidget(
      game: game,
      initialActiveOverlays: const [
        'mainMenu',
      ],
      overlayBuilderMap: {
        'mainMenu': (context, _) => MainMenuScreen(game: game),
        'gameOver': (context, _) => GameOverScreen(game: game),
      },
    ),
  );
}
