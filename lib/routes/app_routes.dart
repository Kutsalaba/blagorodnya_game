import 'package:blagorodnya_game/pages/home_page/home_page.dart';
import 'package:blagorodnya_game/pages/login_page/login_page.dart';
import 'package:blagorodnya_game/pages/profile_page/profile_page.dart';
import 'package:blagorodnya_game/routes/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final GoRouter routes = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: AppRouteConstants.homeRoutePath,
        builder: (BuildContext context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppRouteConstants.loginRoutePath,
        builder: (_, state) => const LoginPage(),
        redirect: (context, state) => _redirect(context),
      ),
      GoRoute(
        path: AppRouteConstants.profileRoutePath,
        builder: (_, state) => const ProfilePage(),
        redirect: (context, state) => _redirect(context),
      ),
    ],
  );

  static String? _redirect(BuildContext context) {
    return true ? null : context.namedLocation("/");
  }
}
