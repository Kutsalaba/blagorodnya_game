import 'package:blagorodnya_game/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:blagorodnya_game/locator.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onTap.call(),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return Colors.red;
            } else {
              return Colors.orange;
            }
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return Colors.blue;
            }
            return Colors.yellow;
          },
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context).primaryTextTheme.displayLarge?.copyWith(
              fontSize: 24,
            ),
      ),
    );
  }
}
