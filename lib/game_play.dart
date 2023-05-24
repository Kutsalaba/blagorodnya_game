import 'package:blagorodnya_game/games/main_game.dart';
import 'package:blagorodnya_game/views/menus/game_over_menu.dart';
import 'package:blagorodnya_game/views/menus/main_menu.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

MainGame _mainGame = MainGame();

enum Menu { main, gameOver }

class GamePlay extends StatelessWidget {
  static const GamePlay _instance = GamePlay._internal();

  factory GamePlay() {
    return _instance;
  }

  const GamePlay._internal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 34,
            spreadRadius: 6,
            offset: const Offset(3, 5),
          ),
        ],
      ),
      child: GameWidget(
        initialActiveOverlays: [Menu.main.name],
        game: _mainGame,
        overlayBuilderMap: {
          Menu.gameOver.name: (BuildContext context, MainGame gameRef) =>
              GameOverMenu(gameRef: gameRef),
          Menu.main.name: (BuildContext context, MainGame gameRef) =>
              MainMenu(gameRef: gameRef),
        },
      ),
    );
  }
}
