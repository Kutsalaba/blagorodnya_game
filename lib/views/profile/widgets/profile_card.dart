import 'package:blagorodnya_game/views/login/cubit/autentication_cubit.dart';
import 'package:blagorodnya_game/views/profile/widgets/profile_card_row_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_framework.dart';


class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    var userId = FirebaseAuth.instance.currentUser!.uid;

    return FutureBuilder<void>(
      future: context
          .read<AuthenticationCubit>()
          .authRepository
          .getUserData(userId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          var user = context.read<AuthenticationCubit>().authRepository.userModel;
          var isSmallThanDesktop =
              ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);
          return ResponsiveRowColumnItem(
            child: ResponsiveRowColumn(
              layout: ResponsiveRowColumnType.COLUMN,
              columnCrossAxisAlignment: CrossAxisAlignment.center,
              columnMainAxisAlignment: MainAxisAlignment.center,
              columnSpacing: 20,
              columnPadding: EdgeInsets.symmetric(
                  horizontal: isSmallThanDesktop ? 15 : 40),
              children: [
                ResponsiveRowColumnItem(
                  child: ProfileCardRowText(
                    title: 'Name: ',
                    userInfoText: user!.name,
                  ),
                ),
                ResponsiveRowColumnItem(
                  child: ProfileCardRowText(
                    title: 'Date registration: ',
                    userInfoText:
                        DateFormat('dd.MM.yyyy').format(user.dateTime),
                  ),
                ),
                ResponsiveRowColumnItem(
                  child: ProfileCardRowText(
                    title: 'Time spent: ',
                    userInfoText: _formatSeconds(user.spendTime),
                  ),
                ),
                ResponsiveRowColumnItem(
                  child: ProfileCardRowText(
                    title: 'High score: ',
                    userInfoText: user.gameScore.toString(),
                  ),
                ),
              ],
            ),
          );
        }
      },
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
