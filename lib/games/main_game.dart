import 'package:blagorodnya_game/components/background_component.dart';
import 'package:blagorodnya_game/components/bait_component.dart';
import 'package:blagorodnya_game/components/octopus_component.dart';
import 'package:blagorodnya_game/components/turtle_component.dart';
import 'package:blagorodnya_game/constants/globals.dart';
import 'package:blagorodnya_game/game_play.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainGame extends FlameGame with HasDraggables, HasCollisionDetection {
  static final MainGame _instance = MainGame._internal();

  factory MainGame() => _instance;

  MainGame._internal();

  @override
  Vector2 get size => Vector2(1080, 600);

  final JoystickComponent _mainGameJoystick = JoystickComponent(
    knob: CircleComponent(
      radius: 30,
      paint: BasicPalette.cyan.withAlpha(190).paint(),
    ),
    background: CircleComponent(
      radius: 70,
      paint: BasicPalette.cyan.withAlpha(100).paint(),
    ),
    margin: const EdgeInsets.only(left: 40, bottom: 40),
  );

  late final TurtleComponent _turtleComponent = TurtleComponent(
    joystick: _mainGameJoystick,
  );

  final BackgroundComponent _backgroundComponent = BackgroundComponent();

  final BaitComponent _baitComponent = BaitComponent();

  int score = 0;

  int get time => _time;

  int _time = 0;

  static int _remainingTime = Globals.gameTimeLimit;

  late Timer gameTimer;

  late TextComponent _scoreText;

  late TextComponent _timerText;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    pauseEngine();

    gameTimer = Timer(
      1,
      repeat: true,
      onTick: () async {
        if (_remainingTime == 0) {
          pauseEngine();

          addMenu(menu: Menu.gameOver);
        }

        _remainingTime -= 1;
        _time += 1;
      },
    );

    // Preload audio files.
    await FlameAudio.audioCache.loadAll(
      [
        Globals.eatSound,
        Globals.killSound,
      ],
    );

    add(_backgroundComponent);

    add(_baitComponent);

    add(OctopusComponent(startPosition: Vector2(180, 180)));
    add(OctopusComponent(startPosition: Vector2(size.x - 200, size.y - 200)));

    add(_turtleComponent);

    add(_mainGameJoystick);

    add(ScreenHitbox());

    _scoreText = TextComponent(
      text: 'Score: $score',
      position: Vector2(40, 50),
      anchor: Anchor.topLeft,
      textRenderer: TextPaint(
        style: TextStyle(
          color: BasicPalette.darkGreen.color,
          fontSize: 25,
          fontFamily: GoogleFonts.comicNeue().fontFamily,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    add(_scoreText);

    _timerText = TextComponent(
      text: 'Time: $_remainingTime secs',
      position: Vector2(size.x - 40, 50),
      anchor: Anchor.topRight,
      textRenderer: TextPaint(
        style: TextStyle(
          color: BasicPalette.darkGreen.color,
          fontSize: 25,
          fontFamily: GoogleFonts.comicNeue().fontFamily,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    add(_timerText);

    gameTimer.start();
  }

  @override
  void update(double dt) {
    super.update(dt);

    gameTimer.update(dt);

    _scoreText.text = 'Score: $score';
    _timerText.text = 'Time: $_remainingTime secs';
  }

  void reset() {
    score = 0;
    _time = 0;

    _remainingTime = Globals.gameTimeLimit;
  }

  void addMenu({
    required Menu menu,
  }) {
    overlays.add(menu.name);
  }

  void removeMenu({
    required Menu menu,
  }) {
    overlays.remove(menu.name);
  }
}
