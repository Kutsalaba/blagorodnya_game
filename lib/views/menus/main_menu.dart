import 'package:blagorodnya_game/games/main_game.dart';
import 'package:blagorodnya_game/game_play.dart';
import 'package:blagorodnya_game/views/menus/menu_background_widget.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  final MainGame gameRef;
  const MainMenu({
    Key? key,
    required this.gameRef,
  }) : super(key: key);

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
                'Blagorodnya Game',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
            ),
            SizedBox(
              width:  200,
              height:  50,
              child: ElevatedButton(
                onPressed: () {
                  gameRef.removeMenu(menu: Menu.main);
                  gameRef.resumeEngine();
                },
                child: const Text(
                  'Play',
                  style: TextStyle(
                    fontSize: 25,
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
