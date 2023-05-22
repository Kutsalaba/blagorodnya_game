// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:blagorodnya_game/components/background_component.dart';
import 'package:blagorodnya_game/components/turtle_component.dart';
import 'package:blagorodnya_game/inputs/joystick.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';


class MainGame extends FlameGame with HasDraggables {

  @override
  Vector2 get size => Vector2(1080, 600);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(BackgroundComponent());
    add(TurtleComponent(joystick: _mainGameJoystick));

    add(_mainGameJoystick);
  }

  final JoystickComponent _mainGameJoystick = JoystickComponent(
    knob: CircleComponent(
      radius: 25,
      paint: BasicPalette.cyan.withAlpha(190).paint(),
    ),
    background: CircleComponent(
      radius: 70,
      paint: BasicPalette.cyan.withAlpha(100).paint(),
    ),
    margin: const EdgeInsets.only(left: 40, bottom: 40),
  );
}
