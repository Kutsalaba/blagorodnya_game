import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

JoystickComponent joystick = JoystickComponent(
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
