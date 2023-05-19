import 'package:blagorodnya_game/pages/home_page/cubit/home_route_cubit.dart';
import 'package:blagorodnya_game/routes/app_route_config.dart';
import 'package:blagorodnya_game/routes/app_route_constants.dart';
import 'package:blagorodnya_game/routes/app_routes.dart';
import 'package:blagorodnya_game/styles/app_colors.dart';
import 'package:blagorodnya_game/widgets/app_bar/main_app_bar.dart';
import 'package:blagorodnya_game/widgets/app_gradient_background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(isLogged: FirebaseAuth.instance.currentUser != null),
      body: AppGradientBackground(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go(AppRouteConstants.profileRoutePath);
              },
              child: Text(
                'Go to Profile',
                style: Theme.of(context).primaryTextTheme.displayLarge,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go(AppRouteConstants.loginRoutePath);
              },
              child: Text('Go to Login'),
              // onPressed: () {

              //   GoRouter.of(context).pushNamed(AppRouteConstants.profileRouteName);
              //   //GoRouter.of(context).go('/login');
              //   //GoRouter.of(context).push(Uri(path: '/login').toString());
              // },
              // child: const Text('/login'),
            ),
          ],
        ),
      ),
    );
  }
}
// StreamBuilder(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return const HomePage();
//           }
//           return const LoginPage();
//         },
//       ),

