import 'package:blagorodnya_game/games/main_game.dart';
import 'package:blagorodnya_game/widgets/app_gradient_background.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const AppGradientBackground(),
        Center(
          child: SizedBox(
            width: 1080,
            height: 600,
            child: GameWidget(game: MainGame()),
          ),
        ),
      ],
    );
  }
}
