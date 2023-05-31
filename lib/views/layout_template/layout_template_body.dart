import 'package:blagorodnya_game/views/cubit/page_cubit.dart';
import 'package:blagorodnya_game/views/home/home_view.dart';
import 'package:blagorodnya_game/views/login/login_view.dart';
import 'package:blagorodnya_game/views/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutTemplateBody extends StatelessWidget {
  const LayoutTemplateBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, PageState>(
      builder: (context, state) {
        if (state is LoginPage) {
          return const LoginView();
        } else if (state is HomePage) {
          return const HomeView();
        } else if (state is ProfilePage) {
          return const ProfileView();
        }
        return const Placeholder();
      },
    );
  }
}
