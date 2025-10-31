import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird_app/ads/banner_ad_widget.dart';
import 'package:flappy_bird_app/game/flappy_game.dart';
import 'package:flappy_bird_app/screens/game_over.dart';
import 'package:flappy_bird_app/screens/main_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize AdMob SDK with test device configuration
  await MobileAds.instance.initialize();

  // Configure test devices (including emulator)
  final RequestConfiguration requestConfiguration = RequestConfiguration(
    testDeviceIds: ['33BE2250B43518CCDA7DE426D04EE231'], // Emulator device ID
  );
  MobileAds.instance.updateRequestConfiguration(requestConfiguration);

  await Flame.device.fullScreen();

  final game = FlappyBirdGame();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameWithAd(game: game),
    ),
  );
}

class GameWithAd extends StatelessWidget {
  final FlappyBirdGame game;

  const GameWithAd({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(
        game: game,
        initialActiveOverlays: const ['mainMenu'],
        overlayBuilderMap: {
          'mainMenu': (context, _) => MainMenuScreen(game: game),
          'gameOver': (context, _) => GameOverScreen(game: game),
        },
      ),
      bottomNavigationBar: const BannerAdWidget(),
    );
  }
}
