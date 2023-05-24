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
    // Container(
    //   color: AppColors.beadedBlueColor,
    //   height: preferredSize.height,
    //   width: preferredSize.width,
    //   child: Expanded(
    //     child: Row(
    //       children: [],
    //     ),
    //   ),
    // );

    // Container(
    //   height: 50,
    //   color: const Color(0xff382993),
    //   padding: ResponsiveValue<EdgeInsets>(context,
    //       defaultValue: const EdgeInsets.symmetric(
    //         horizontal: 35,
    //       ),
    //       valueWhen: [
    //         const Condition.smallerThan(
    //             name: TABLET, value: EdgeInsets.symmetric(horizontal: 0))
    //       ]).value,
    //   child: Row(
    //     children: [
    //       ResponsiveVisibility(
    //         visible: true,
    //         hiddenWhen: const [Condition.smallerThan(name: TABLET)],
    //         child: Expanded(
    //           child: Container(),
    //         ),
    //       ),
    //       ResponsiveVisibility(
    //         visible: false,
    //         visibleWhen: const [Condition.smallerThan(name: TABLET)],
    //         child: IconButton(
    //           onPressed: () {},
    //           icon: const Icon(Icons.menu, color: Color(0xfffffff2), size: 24),
    //         ),
    //       ),
    //       ResponsiveVisibility(
    //         visible: true,
    //         hiddenWhen: const [Condition.smallerThan(name: TABLET)],
    //         child: TextButton(
    //           onPressed: () {},
    //           style: TextButton.styleFrom(
    //             padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
    //           ),
    //           child: const Text(
    //             'Sign in',
    //             style: TextStyle(
    //               fontSize: 14,
    //               color: Color(0xFFF8F9FA),
    //             ),
    //           ),
    //         ),
    //       ),
    //       ResponsiveVisibility(
    //         visible: true,
    //         hiddenWhen: const [Condition.smallerThan(name: TABLET)],
    //         child: TextButton(
    //           onPressed: () {},
    //           style: TextButton.styleFrom(
    //             padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
    //           ),
    //           child: Row(
    //             mainAxisSize: MainAxisSize.min,
    //             children: const [
    //               Text(
    //                 'Help',
    //                 style: TextStyle(
    //                   fontSize: 14,
    //                   color: Color(0xFFF8F9FA),
    //                 ),
    //               ),
    //               Icon(
    //                 Icons.keyboard_arrow_down,
    //                 color: Color(0xFF757575),
    //                 size: 18,
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
 


