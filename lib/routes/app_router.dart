import 'package:blagorodnya_game/routes/app_route_constants.dart';
import 'package:blagorodnya_game/views/home/home_view.dart';
import 'package:blagorodnya_game/views/login/login_view.dart';
import 'package:blagorodnya_game/views/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRouteConstants.homeRoutePath:
      return _getPageRoute(const HomeView(), settings.name!);
    case AppRouteConstants.loginRoutePath:
      return _getPageRoute(const LoginView(), settings.name!);
    case AppRouteConstants.profileRoutePath:
      return _getPageRoute(const ProfileView(), settings.name!);
    default:
      return _getPageRoute(const HomeView(), settings.name!);
  }
}

PageRoute _getPageRoute(Widget child, String routeName) {
  return _FadeRoute(child: child, routeName: routeName);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({required this.child, required this.routeName})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          settings: RouteSettings(name: routeName),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
