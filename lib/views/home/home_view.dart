import 'package:blagorodnya_game/game_play.dart';
import 'package:blagorodnya_game/widgets/app_gradient_background.dart';
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
            child: GamePlay(),
          ),
        ),
      ],
    );
  }
}
