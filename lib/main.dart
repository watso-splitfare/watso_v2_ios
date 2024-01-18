import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:watso_v2/common/constants/styles.dart';
import 'package:watso_v2/taxi/pages/MainPage.dart';
import 'package:watso_v2/taxi/pages/RecruitmentPage.dart';

import 'common/widgets/Layout.dart';
import 'taxi/pages/MessagingPage.dart';

void main() {
  runApp(const MyApp());
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: "/",
  routes: <RouteBase>[
    ShellRoute(
        navigatorKey: _shellNavigatorKey,
        pageBuilder: (BuildContext context, GoRouterState state, child) {
          print("state.path: ${state.fullPath}");
          return NoTransitionPage(
            child: PageLayout(
              body: child,
              location: state.fullPath ?? "/",
            ),
          );
        },
        routes: [
          GoRoute(
            path: '/',
            parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return NoTransitionPage(child: const TaxiMainPage());
            },
          ),
          GoRoute(
              path: '/message',
              parentNavigatorKey: _shellNavigatorKey,
              pageBuilder: (BuildContext context, GoRouterState state) {
                return NoTransitionPage(child: MessagingPage());
              }),
          GoRoute(
              path: '/person',
              parentNavigatorKey: _shellNavigatorKey,
              pageBuilder: (BuildContext context, GoRouterState state) {
                return NoTransitionPage(child: MessagingPage());
              }),
        ]),
    GoRoute(
      path: '/post/:pageId',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        return TaxiRecruitmentPage(
          pageId: state.pathParameters['pageId']!,
        );
      },
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
          focusColor: WatsoColor.primary,
          fontFamily: 'NotoSans',
        ));
  }
}
