import 'package:blagorodnya_game/views/profile/widgets/profile_card_row_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    var isSmallThanDesktop =
        ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);
    return ResponsiveRowColumnItem(
      child: ResponsiveRowColumn(
        layout: ResponsiveRowColumnType.COLUMN,
        columnCrossAxisAlignment: CrossAxisAlignment.center,
        columnMainAxisAlignment: MainAxisAlignment.center,
        columnSpacing: 20,
        columnPadding:
            EdgeInsets.symmetric(horizontal: isSmallThanDesktop ? 15 : 40),
        children: const [
          ResponsiveRowColumnItem(
            child: ProfileCardRowText(
              title: 'Name: ',
              userInfoText: 'UserData',
            ),
          ),
          ResponsiveRowColumnItem(
            child: ProfileCardRowText(
              title: 'Date registration: ',
              userInfoText: 'UserData',
            ),
          ),
          ResponsiveRowColumnItem(
            child: ProfileCardRowText(
              title: 'Time spent: ',
              userInfoText: 'UserData',
            ),
          ),
        ],
      ),
    );
  }
}
