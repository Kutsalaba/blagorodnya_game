import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  print('run all the code in main');
  print('we will build a class for a game');
  runApp(GameWidget(game: MyGame()));
}

class MyGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    print('we will load the game assets here');
  }
}
