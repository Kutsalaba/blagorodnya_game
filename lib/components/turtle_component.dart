import 'package:blagorodnya_game/components/octopus_component.dart';
import 'package:blagorodnya_game/constants/globals.dart';
import 'package:blagorodnya_game/games/main_game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';

enum MovementState {
  idle,
  goLeft,
  goRight,
  attacked,
}

class TurtleComponent extends SpriteGroupComponent<MovementState>
    with HasGameRef<MainGame>, CollisionCallbacks {
  final double _spriteHeight = 100;

  static double _speed = 500.0;

  /// Screen boundries.
  late double _rightBound;
  late double _leftBound;
  late double _upBound;
  late double _downBound;

  bool isAttacked = false;

  final JoystickComponent joystick;

  final Timer _attackedCountdown = Timer(Globals.noActiveTimeLimit.toDouble());

  TurtleComponent({required this.joystick});

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final Sprite turtleIdle =
        await gameRef.loadSprite(Globals.turtleIdleSprite);
    final Sprite turtleGoRigth =
        await gameRef.loadSprite(Globals.turtleRightSprite);
    final Sprite turtleGoLeft =
        await gameRef.loadSprite(Globals.turtleLeftSprite);
    final Sprite turtleIdleAttacked =
        await gameRef.loadSprite(Globals.turtleIdleAttackedSprite);

    sprites = {
      MovementState.idle: turtleIdle,
      MovementState.goLeft: turtleGoLeft,
      MovementState.goRight: turtleGoRigth,
      MovementState.attacked: turtleIdleAttacked,
    };

    _rightBound = gameRef.size.x - 120;
    _leftBound = 0 + 5;
    _upBound = 0 + 40;
    _downBound = gameRef.size.y - 35;

    current = MovementState.idle;

    position = gameRef.size / 2;
    height = _spriteHeight;
    width = _spriteHeight * 1.22;
    anchor = Anchor.centerLeft;

    current = MovementState.idle;

    add(CircleHitbox()..radius = 1);
  }

  @override
  void update(dt) {
    super.update(dt);

    if (!isAttacked) {
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
    } else {
      _attackedCountdown.update(dt);
      if (_attackedCountdown.finished) {
        _activateTurtle();
      }
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if (other is OctopusComponent) {
      _attackTurtle();
    }
  }

  void _attackTurtle() {
    if (!isAttacked) {
      isAttacked = true;

      FlameAudio.play(Globals.killSound);

      current = MovementState.attacked;

      _attackedCountdown.start();
    }
  }

  void _activateTurtle() {
    isAttacked = false;

    current = MovementState.idle;
  }
}
