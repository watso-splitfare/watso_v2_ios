import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:watso_v2/common/user/user_provider.dart';
import 'package:watso_v2/common/widgets/Layout.dart';
import 'package:watso_v2/taxi/pages/login_screen.dart';
import 'package:watso_v2/taxi/pages/main_screen.dart';
import 'package:watso_v2/taxi/pages/messaging_screen.dart';
import 'package:watso_v2/taxi/pages/recruitment_screen.dart';
import 'package:watso_v2/taxi/pages/splash_screen.dart';

part 'router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter myRouter(ref) {
  final isAuth = ValueNotifier<AsyncValue<bool>>(const AsyncLoading());
  ref
    ..onDispose(() => isAuth.dispose())
    ..listen(authControllerProvider, (_, isAuthValue) {
      // isAuthValue is null
      if (isAuthValue == null) {
        isAuth.value = const AsyncData(false);
      } else {
        isAuth.value = const AsyncData(true);
      }
    });

  return GoRouter(
      routes: _routes,
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/splash',
      refreshListenable: isAuth,
      debugLogDiagnostics: true,
      redirect: (context, state) {
        if (isAuth.value.isLoading || !isAuth.value.hasValue) {
          return '/splash';
        }

        final auth = isAuth.value.requireValue;
        if (state.uri.path == '/splash') {
          return auth ? '/' : '/login';
        }
        if (state.uri.path == '/login') {
          return auth ? '/' : null;
        }
        return auth ? null : '/login';
      });
}
// splash screen 만들어야함.

final List<RouteBase> _routes = [
  GoRoute(
    path: '/splash',
    builder: (context, state) {
      return const SplashScreen();
    },
  ),
  GoRoute(
    path: '/login',
    builder: (context, state) {
      return const LoginPage();
    },
  ),
  ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, child) {
        return PageLayout(
          body: child,
          location: state.fullPath ?? "/",
        );
      },
      routes: [
        GoRoute(
          path: '/',
          parentNavigatorKey: _shellNavigatorKey,
          builder: (BuildContext context, GoRouterState state) {
            return const TaxiMainPage();
          },
        ),
        GoRoute(
            path: '/message',
            parentNavigatorKey: _shellNavigatorKey,
            builder: (BuildContext context, GoRouterState state) {
              return MessagingPage();
            }),
        GoRoute(
            path: '/person',
            parentNavigatorKey: _shellNavigatorKey,
            builder: (BuildContext context, GoRouterState state) {
              return MessagingPage();
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
  GoRoute(
    path: '/login',
    builder: (context, state) => LoginPage(),
  ),
];
