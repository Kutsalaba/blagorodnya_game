import 'package:blagorodnya_game/games/main_game.dart';
import 'package:blagorodnya_game/game_play.dart';
import 'package:blagorodnya_game/styles/app_colors.dart';
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 160),
            child: Text(
              'Blagorodnya Game',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: AppColors.brandywineRaspberryColor,
                  ),
            ),
          ),
          SizedBox(
            width: 240,
            height: 70,
            child: ElevatedButton(
              onPressed: () {
                gameRef.removeMenu(menu: Menu.main);
                gameRef.resumeEngine();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade600,
                foregroundColor: Colors.white,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text(
                'Play',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
