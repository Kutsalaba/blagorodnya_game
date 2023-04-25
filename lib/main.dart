//import 'package:flame/game.dart';
import 'package:blagorodnya_game/pages/home_page/home_page.dart';
import 'package:blagorodnya_game/pages/login_page/login_page.dart';
import 'package:blagorodnya_game/routes/app_route_config.dart';
import 'package:blagorodnya_game/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCujVJvIrgOB3Q5GKFPfXvvBftk6TjmEBk",
      appId: "1:275636510331:web:0ee102ab25d6f4d4508cde",
      projectId: "blagorodnya-game",
      messagingSenderId: "275636510331",
    ),
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: AppRoutes.routes,
      // routeInformationParser:
      //     AppRouterConfig.returnRouter(false).routeInformationParser,
      // routerDelegate: AppRouterConfig.returnRouter(false).routerDelegate,
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        breakpoints: [
          const ResponsiveBreakpoint.resize(240, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(650, name: TABLET),
          const ResponsiveBreakpoint.autoScale(900, name: TABLET),
          const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          const ResponsiveBreakpoint.resize(2468, name: '4K'),
        ],
      ),
    );
  }
}


// void main() {
//   print('run all the code in main');
//   print('we will build a class for a game');
//   runApp(GameWidget(game: MyGame()));
// }

// class MyGame extends FlameGame {
//   @override
//   Future<void> onLoad() async {
//     super.onLoad();
//     print('we will load the game assets here');
//   }
// }
