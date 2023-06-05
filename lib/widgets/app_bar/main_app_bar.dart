import 'package:blagorodnya_game/styles/app_colors.dart';
import 'package:blagorodnya_game/views/cubit/page_cubit.dart';
import 'package:blagorodnya_game/views/login/cubit/autentication_cubit.dart';
import 'package:blagorodnya_game/widgets/app_bar/nav_bar_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize {
    return const Size.fromHeight(60);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, bool>(
      builder: (context, isLogged) {
        var pageCubit = context.read<PageCubit>();
        var authCubit = context.read<AuthenticationCubit>();
        return AppBar(
          centerTitle: false,
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.beadedBlueColor,
          actions: [
            NavBarItem(
              text: isLogged ? 'Profile' : 'Login',
              onTap: () => isLogged
                  ? pageCubit.goToProfile()
                  : pageCubit.goToLogin(),
            ),
            if (isLogged)
              NavBarItem(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  authCubit.logout(() => pageCubit.goToHome());
                },
                text: 'LogOut',
              ),
          ],
          title: InkWell(
            onTap: () {
              pageCubit.goToHome();
            },
            child: Text(
              'Blagorodnya Game',
              style: Theme.of(context).primaryTextTheme.displayLarge,
            ),
          ),
        );
      },
    );
  }
}