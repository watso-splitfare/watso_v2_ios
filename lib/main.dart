import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:watso_v2/common/constants/styles.dart';
import 'package:watso_v2/taxi/pages/MainPage.dart';
import 'package:watso_v2/taxi/pages/RecruitmentPage.dart';

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
          path: 'post/:pageId',
          builder: (BuildContext context, GoRouterState state) {
            return TaxiRecruitmentPage(
              pageId: state.pathParameters['pageId']!,
            );
          },
        ),
      ],
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
        theme: ThemeData(
          primaryColor: WatsoColor.primary,
          highlightColor: WatsoColor.primary,

        ));
  }
}
