import 'package:blagorodnya_game/game_play.dart';
import 'package:blagorodnya_game/games/main_game.dart';
import 'package:blagorodnya_game/views/login/cubit/autentication_cubit.dart';
import 'package:blagorodnya_game/views/login/models/user_params.dart';
import 'package:blagorodnya_game/views/menus/menu_background_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameOverMenu extends StatelessWidget {
  final MainGame gameRef;
  const GameOverMenu({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var userParams = UserParams(
        spendTime: gameRef.time - 1,
        gameScore: gameRef.score,
      );
      final userCubit = context.read<AuthenticationCubit>();
      Future.microtask(
        () async => await userCubit.authRepository.upgradeUserData(
          user.email!,
          userParams,
        ),
      );
    }
    return MenuBackgroundWidget(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Text(
                'Game Over',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Text(
                'Score: ${gameRef.score}',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: Colors.white,
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade600,
                  foregroundColor: Colors.white,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade600,
                  foregroundColor: Colors.white,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Main Menu',
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
