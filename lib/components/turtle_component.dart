import 'package:blagorodnya_game/constants/globals.dart';
import 'package:blagorodnya_game/games/main_game.dart';
import 'package:flame/components.dart';

enum MovementState {
  idle,
  goLeft,
  goRight,
}

class TurtleComponent extends SpriteGroupComponent<MovementState>
    with HasGameRef<MainGame> {
  final double _spriteHeight = 70;

  final double _speed = 500;

  late double _rightBound;
  late double _leftBound;
  late double _upBound;
  late double _downBound;

  JoystickComponent joystick;

  TurtleComponent({required this.joystick});

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    Sprite turtleIdle = await gameRef.loadSprite(Globals.turtleIdleSprite);
    Sprite turtleGoRigth = await gameRef.loadSprite(Globals.turtleRightSprite);
    Sprite turtleGoLeft = await gameRef.loadSprite(Globals.turtleLeftSprite);

    sprites = {
      MovementState.idle: turtleIdle,
      MovementState.goLeft: turtleGoLeft,
      MovementState.goRight: turtleGoRigth,
    };

    _rightBound = gameRef.size.x;
    _leftBound = 45;
    _upBound = 55;
    _downBound = gameRef.size.y - 85;

    current = MovementState.idle;

    position = gameRef.size / 2;
    height = _spriteHeight;
    width = _spriteHeight * 1.22;
    anchor = Anchor.centerLeft;
  }

  @override
  void update(dt) {
    super.update(dt);

    if (joystick.direction == JoystickDirection.idle) {
      current = MovementState.idle;
      return;
    }

    if (x >= _rightBound) {
      x = _rightBound - 1;
    }

    if (x <= _leftBound) {
      x = _leftBound + 1;
    }

    if (y <= _upBound) {
      y = _upBound + 1;
    }

    if (y >= _downBound) {
      y = _downBound - 1;
    }

    bool movingLeft = joystick.relativeDelta[0] < 0;

    if (movingLeft) {
      current = MovementState.goLeft;
    } else {
      current = MovementState.goRight;
    }

    position.add(joystick.relativeDelta * _speed * dt);
  }
}
