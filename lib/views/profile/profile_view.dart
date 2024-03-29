import 'package:blagorodnya_game/styles/app_colors.dart';
import 'package:blagorodnya_game/views/login/cubit/authentication_cubit.dart';
import 'package:blagorodnya_game/views/profile/widgets/profile_card.dart';
import 'package:blagorodnya_game/views/profile/widgets/free_info_widget.dart';
import 'package:blagorodnya_game/widgets/app_gradient_background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var isSmallThanDesktop =
        ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);
    var userId = FirebaseAuth.instance.currentUser!.uid;
    return AppGradientBackground(
      child: FutureBuilder<void>(
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
            var user =
                context.read<AuthenticationCubit>().authRepository.userModel;
            return ResponsiveRowColumn(
              layout: isSmallThanDesktop
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              rowCrossAxisAlignment: CrossAxisAlignment.start,
              columnCrossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ResponsiveRowColumnItem(
                  child: FreeInfoWidget(
                    email: user!.email,
                  ),
                ),
                ResponsiveRowColumnItem(
                  child: SizedBox(
                    width: isSmallThanDesktop ? 15 : 40,
                  ),
                ),
                ResponsiveRowColumnItem(
                  child: ResponsiveRowColumn(
                    layout: ResponsiveRowColumnType.COLUMN,
                    children: [
                      ResponsiveRowColumnItem(
                        child: Text(
                          'Player Information',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      ResponsiveRowColumnItem(
                        child: Container(
                          width: isSmallThanDesktop ? 350 : 720,
                          height: isSmallThanDesktop ? 200 : 360,
                          decoration: BoxDecoration(
                            color: AppColors.overGrowthColor,
                            borderRadius: BorderRadius.circular(
                                isSmallThanDesktop ? 16 : 50),
                            border: Border.all(
                              color: AppColors.overGrownTempleColor,
                              width: 1.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 2,
                                spreadRadius: 1,
                                offset: const Offset(2, 1),
                              ),
                            ],
                          ),
                          child: ProfileCard(
                            name: user.name,
                            spendTime: user.spendTime,
                            gameScore: user.gameScore,
                            dateTime: user.dateTime,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
