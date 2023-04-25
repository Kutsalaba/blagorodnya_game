import 'package:blagorodnya_game/pages/home_page/home_page.dart';
import 'package:blagorodnya_game/pages/login_page/login_page.dart';
import 'package:blagorodnya_game/pages/profile_page/profile_page.dart';
import 'package:blagorodnya_game/routes/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouterConfig {
  static GoRouter returnRouter(bool isAuth) {
    GoRouter router = GoRouter(
      routes: [
        // GoRoute(
        //     path: '/details/:id',
        //     pageBuilder: (context, state) {
        //       return MaterialPage(
        //         child: DetailsPage(id: state.params['id']!),
        //       );
        //     }),
        GoRoute(
          name: 'home',
          path: AppRouteConstants.homeRoutePath,
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: HomePage(),
            );
          },
        ),
        GoRoute(
          name: 'login',
          path: AppRouteConstants.loginRoutePath,
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: LoginPage(),
            );
          },
        ),
        GoRoute(
          name: 'profile',
          path: AppRouteConstants.profileRoutePath,
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: ProfilePage(),
            );
          },
        ),
      ],
      errorPageBuilder: (context, state) {
        return const MaterialPage(child: HomePage());
      },
      redirect: (context, state) {
        if (!isAuth &&
            state.location.startsWith(AppRouteConstants.profileRoutePath)) {
          return context.namedLocation('/');
        } else {
          return null;
        }
      },
    );
    return router;
  }
}
