import 'package:blagorodnya_game/details_page.dart';
import 'package:blagorodnya_game/pages/home_page/home_page.dart';
import 'package:blagorodnya_game/pages/login_page/login_page.dart';
import 'package:blagorodnya_game/routes/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final GoRouter routes = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: AppRouteConstants.homeRouteName,
        builder: (BuildContext context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppRouteConstants.loginRouteName,
        builder: (_, state) => const LoginPage(),
        redirect: (context, state) => _redirect(context),
      ),
      GoRoute(
        path: AppRouteConstants.profileRouteName,
        builder: (_, state) => const DetailsView(),
        redirect: (context, state) => _redirect(context),
      ),
    ],
  );

  static String? _redirect(BuildContext context) {
    return true ? null : context.namedLocation("/");
  }
}
