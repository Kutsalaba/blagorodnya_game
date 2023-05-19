import 'package:blagorodnya_game/locator.dart';
import 'package:blagorodnya_game/routes/app_route_constants.dart';
import 'package:blagorodnya_game/routes/app_router.dart';
import 'package:blagorodnya_game/services/navigation_service.dart';
import 'package:blagorodnya_game/widgets/app_bar/main_app_bar.dart';
import 'package:blagorodnya_game/widgets/app_gradient_background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(isLogged: FirebaseAuth.instance.currentUser != null),
      body: AppGradientBackground(
        child: Column(
          children: [
            Expanded(
              child: Navigator(
                key: locator<NavigationService>().navigatorKey,
                onGenerateRoute: generateRoute,
                initialRoute: AppRouteConstants.homeRoutePath,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
