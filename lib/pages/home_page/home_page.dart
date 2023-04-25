import 'package:blagorodnya_game/routes/app_route_config.dart';
import 'package:blagorodnya_game/routes/app_route_constants.dart';
import 'package:blagorodnya_game/widgets/app_bar/main_app_bar.dart';
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
      appBar: const MainAppBar(),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
               GoRouter.of(context).go(AppRoutes.DashboardRoute);
            }
,
            child: Text('Go to Details'),
            // onPressed: () {

            //   GoRouter.of(context).pushNamed(AppRouteConstants.profileRouteName);
            //   //GoRouter.of(context).go('/login');
            //   //GoRouter.of(context).push(Uri(path: '/login').toString());
            // },
            // child: const Text('/login'),
          ),
        ],
      ),
      // AppBar(
      //   actions: [
      //     IconButton(
      //       onPressed: () async {
      //         await FirebaseAuth.instance.signOut();
      //       },
      //       icon: const Icon(Icons.logout_outlined),
      //     ),
      //   ],
      //   title: const Text('Home'),
      // ),
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
