import 'package:blagorodnya_game/styles/app_theme_data.dart';
import 'package:blagorodnya_game/views/cubit/page_cubit.dart';
import 'package:blagorodnya_game/views/layout_template/layout_template.dart';
import 'package:blagorodnya_game/views/login/cubit/autentication_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_strategy/url_strategy.dart';

import 'locator.dart';

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
  setupLocator();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationCubit>.value(value: AuthenticationCubit()),
       
        BlocProvider(
          create: (context) => PageCubit(),
          child: const LayoutTemplate(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter',
        theme: AppThemeData().defaultThemeData,
        // routerConfig: AppRoutes.routes,
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
          home: BlocProvider(
          create: (context) => PageCubit(),
          child: const LayoutTemplate(),
        ),
      ),
    );
  }
}
