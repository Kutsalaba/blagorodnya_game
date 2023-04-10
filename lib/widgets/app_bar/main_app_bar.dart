import 'package:blagorodnya_game/widgets/app_bar/app_bar_text_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize {
    return const Size.fromHeight(55);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        AppBarTextButton(
          onPressed: () {},
          text: 'Button',
        ),
        
      ],
      centerTitle: false,
      title: const Text('Hey'),
    );

    Container(
      height: 50,
      color: const Color(0xff382993),
      padding: ResponsiveValue<EdgeInsets>(context,
          defaultValue: const EdgeInsets.symmetric(
            horizontal: 35,
          ),
          valueWhen: [
            const Condition.smallerThan(
                name: TABLET, value: EdgeInsets.symmetric(horizontal: 0))
          ]).value,
      child: Row(
        children: [
          ResponsiveVisibility(
            visible: true,
            hiddenWhen: const [Condition.smallerThan(name: TABLET)],
            child: Expanded(
              child: Container(),
            ),
          ),
          ResponsiveVisibility(
            visible: false,
            visibleWhen: const [Condition.smallerThan(name: TABLET)],
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu, color: Color(0xfffffff2), size: 24),
            ),
          ),
          ResponsiveVisibility(
            visible: true,
            hiddenWhen: const [Condition.smallerThan(name: TABLET)],
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              ),
              child: const Text(
                'Sign in',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFFF8F9FA),
                ),
              ),
            ),
          ),
          ResponsiveVisibility(
            visible: true,
            hiddenWhen: const [Condition.smallerThan(name: TABLET)],
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'Help',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFF8F9FA),
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xFF757575),
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
