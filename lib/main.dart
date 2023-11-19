import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:watso_v2/taxi/pages/MainPage.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const TaxiMainPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const TaxiMainPage();
          },
        ),
      ],
      // routes: <RouteBase>[
      //   GoRoute(
      //     path: 'details',
      //     builder: (BuildContext context, GoRouterState state) {
      //       return const DetailsScreen();
      //     },
      //   ),
      // ],
    ),
  ],
);


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Watso',
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

