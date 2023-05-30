import 'package:blagorodnya_game/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppGradientBackground extends StatelessWidget {
  const AppGradientBackground({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.brandywineRaspberryColor,
            AppColors.forestFernColor,
          ],
        ),
      ),
      child: child,
    );
  }
}
