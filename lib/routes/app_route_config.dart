import 'package:blagorodnya_game/details_page.dart';
import 'package:blagorodnya_game/pages/home_page/home_page.dart';
import 'package:blagorodnya_game/pages/login_page/login_page.dart';
import 'package:blagorodnya_game/routes/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



class AppRoutes {
  static const loginRoute = "/";
  static const DashboardRoute = "/Dashboard";
  static const DetailsRoute = "/Details";

  static final GoRouter routes = GoRouter(routes: <GoRoute>[
    GoRoute(
      path: loginRoute,
      builder: (BuildContext context, state) => const HomePage(),
    ),
    GoRoute(
      path: DashboardRoute,
      builder: (_, state) => const LoginPage(),
      redirect: (context, state) => _redirect(context),
    ),
    GoRoute(
      path: DetailsRoute,
      builder: (_, state) => const DetailsView(),
      redirect: (context, state) => _redirect(context),
    ),
  ]);

  static String? _redirect(BuildContext context) {
    return true ? null : context.namedLocation("/");
  }
}



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
          name: AppRouteConstants.homeRouteName,
          path: '/',
          pageBuilder: (context, state) {
            return const MaterialPage(child: HomePage());
          },
        ),
        GoRoute(
          name: AppRouteConstants.profileRouteName,
          path: '/login',
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: LoginPage(),
            );
          },
        ),
      ],
      errorPageBuilder: (context, state) {
        return const MaterialPage(child: HomePage());
      },
      redirect: (context, state) {
        if (!isAuth &&
            state.location
                .startsWith('/${AppRouteConstants.profileRouteName}')) {
          return context.namedLocation(AppRouteConstants.homeRouteName);
        } else {
          return null;
        }
      },
    );
    return router;
  }
}

class DetailsPage extends StatelessWidget {
  final String id;

  const DetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: Center(
        child: Text('Details for ID $id'),
      ),
    );
  }
}
