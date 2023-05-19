import 'package:blagorodnya_game/constants/globals.dart';
import 'package:blagorodnya_game/games/main_game.dart';
import 'package:flame/components.dart';

class BackgroundComponent extends SpriteComponent with HasGameRef<MainGame> {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite(Globals.backgroundSprite);
    size = gameRef.size;
  }
}
