import 'package:blagorodnya_game/widgets/app_bar/main_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainAppBar(),
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
