import 'dart:math';

import 'package:blagorodnya_game/components/turtle_component.dart';
import 'package:blagorodnya_game/constants/globals.dart';
import 'package:blagorodnya_game/games/main_game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';


class BaitComponent extends SpriteComponent
    with HasGameRef<MainGame>, CollisionCallbacks {

  final double _spriteHeight = 70.0;

  final Random _random = Random();

  BaitComponent();

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite(Globals.baitSprite);

    position = _createRandomPosition();

    width = _spriteHeight;
    height = _spriteHeight;

    anchor = Anchor.center;

    add(CircleHitbox()..radius = 1);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is TurtleComponent) {
      FlameAudio.play(Globals.eatSound);

      removeFromParent();

      gameRef.score += 1;

      gameRef.add(BaitComponent());
    }
  }

  Vector2 _createRandomPosition() {
    final double x = _random.nextInt(gameRef.size.x.toInt()).toDouble();
    final double y = _random.nextInt(gameRef.size.y.toInt()).toDouble();

    return Vector2(x, y);
  }
}
