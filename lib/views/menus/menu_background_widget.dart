import 'package:blagorodnya_game/constants/globals.dart';
import 'package:flutter/material.dart';

class MenuBackgroundWidget extends StatelessWidget {
  const MenuBackgroundWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/${Globals.backgroundStarter}"),
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      ),
    );
  }
}
