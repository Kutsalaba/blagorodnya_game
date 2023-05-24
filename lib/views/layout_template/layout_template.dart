import 'package:blagorodnya_game/views/cubit/page_cubit.dart';
import 'package:blagorodnya_game/views/home/home_view.dart';
import 'package:blagorodnya_game/views/login/login_view.dart';
import 'package:blagorodnya_game/views/profile/profile_view.dart';
import 'package:blagorodnya_game/widgets/app_bar/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: BlocBuilder<PageCubit, PageState>(
        builder: (context, state) {
          if (state is LoginPage) {
            return const LoginView();
          } else if (state is HomePage) {
            return const HomeView();
          } else if (state is ProfilePage) {
            return const ProfileView();
          }
           //return const LoginView();
          return const Placeholder();
        },
      ),
    );
  }
}
