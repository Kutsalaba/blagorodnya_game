// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:blagorodnya_game/components/background_component.dart';
import 'package:blagorodnya_game/components/turtle_component.dart';
import 'package:blagorodnya_game/inputs/joystick.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';

class MyCrate extends SpriteComponent {
  MyCrate() : super(size: Vector2.all(80));

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('crate.png');
  }
}

class MainGame extends FlameGame with HasDraggables {
  // @override
  // Color backgroundColor() => const Color.fromARGB(250, 42, 138, 240);

  @override
  Vector2 get size => Vector2(1080, 600);

  @override
  Future<void> onLoad() async {
    // await add(MyCrate());
    await super.onLoad();
    add(BackgroundComponent());
    add(TurtleComponent(joystick: joystick));

    add(joystick);
  }
}
