import 'package:blagorodnya_game/styles/app_colors.dart';
import 'package:blagorodnya_game/views/login/widgets/auth_form.dart';
import 'package:blagorodnya_game/widgets/app_gradient_background.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppGradientBackground(
      child: Center(
        child: Container(
          width: 920,
          height: 500,
          decoration: BoxDecoration(
            color: AppColors.overGrowthColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 2,
                spreadRadius: 2,
                offset: const Offset(8, 8),
              ),
            ],
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 270),
            child: AuthForm(),
          ),
        ),
      ),
    );
  }
}
