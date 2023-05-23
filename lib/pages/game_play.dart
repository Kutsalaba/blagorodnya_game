import 'package:blagorodnya_game/games/main_game.dart';
import 'package:blagorodnya_game/pages/menus/game_over_menu.dart';
import 'package:blagorodnya_game/pages/menus/main_menu.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

MainGame _mainGame = MainGame();

enum Menu { main, gameOver }

class GamePlay extends StatelessWidget {
  const GamePlay({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      initialActiveOverlays: [Menu.main.name],
      game: _mainGame,
      overlayBuilderMap: {
        Menu.gameOver.name: (BuildContext context, MainGame gameRef) =>
            GameOverMenu(gameRef: gameRef),
        Menu.main.name: (BuildContext context, MainGame gameRef) =>
            MainMenu(gameRef: gameRef),
      },
    );
  }
}
