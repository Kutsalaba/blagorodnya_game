import 'package:blagorodnya_game/games/main_game.dart';
import 'package:blagorodnya_game/game_play.dart';
import 'package:blagorodnya_game/views/menus/menu_background_widget.dart';
import 'package:flutter/material.dart';


class GameOverMenu extends StatelessWidget {
  final MainGame gameRef;
  const GameOverMenu({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuBackgroundWidget(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Text(
                'Game Over',
                style: TextStyle(
                  fontSize:  50,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Text(
                'Score: ${gameRef.score}',
                style: const TextStyle(
                  fontSize: 50,
                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  gameRef.removeMenu(menu: Menu.gameOver);
                  gameRef.reset();
                  gameRef.resumeEngine();
                },
                child: const Text(
                  'Play Again?',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  gameRef.removeMenu(menu: Menu.gameOver);
                  gameRef.reset();
                  gameRef.addMenu(menu: Menu.main);
                },
                child: const Text(
                  'Main Menu',
                  style: TextStyle(
                    fontSize:  25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
