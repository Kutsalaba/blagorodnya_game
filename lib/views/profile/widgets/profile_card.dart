import 'package:blagorodnya_game/views/profile/widgets/profile_card_row_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.name,
    required this.spendTime,
    required this.gameScore,
    required this.dateTime,
  });

  final String name;
  final int spendTime;
  final int gameScore;
  final DateTime dateTime;

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
        children: [
          ResponsiveRowColumnItem(
            child: ProfileCardRowText(
              title: 'Name: ',
              userInfoText: name,
            ),
          ),
          ResponsiveRowColumnItem(
            child: ProfileCardRowText(
              title: 'Date registration: ',
              userInfoText: DateFormat('dd.MM.yyyy').format(dateTime),
            ),
          ),
          ResponsiveRowColumnItem(
            child: ProfileCardRowText(
              title: 'Time spent: ',
              userInfoText: _formatSeconds(spendTime),
            ),
          ),
          ResponsiveRowColumnItem(
            child: ProfileCardRowText(
              title: 'High score: ',
              userInfoText: gameScore.toString(),
            ),
          ),
        ],
      ),
    );
  }

  String _formatSeconds(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;

    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');

    return '$hoursStr:$minutesStr:$secondsStr';
  }
}
