import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:watso_v2/common/router/routes.dart';
import 'package:watso_v2/common/user/user_provider.dart';
import 'package:watso_v2/common/widgets/Layout.dart';

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
      initialLocation: Routes.splash.path,
      refreshListenable: isAuth,
      debugLogDiagnostics: true,
      redirect: (context, state) {
        if (isAuth.value.isLoading || !isAuth.value.hasValue) {
          return Routes.splash.path;
        }

        final auth = isAuth.value.requireValue;
        if (state.uri.path == Routes.splash.path) {
          return auth ? Routes.taxiMain.path : Routes.login.path;
        }
        if (state.uri.path == Routes.login.path) {
          return auth ? Routes.taxiMain.path : null;
        }
        return auth ? null : Routes.login.path;
      });
}
// splash screen 만들어야함.

final List<RouteBase> _routes = [
  GoRoute(
    path: Routes.splash.path,
    builder: (context, state) {
      return Routes.splash.screen;
    },
  ),
  GoRoute(
    path: Routes.login.path,
    builder: (context, state) {
      return Routes.login.screen;
    },
  ),
  ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, child) {
        return PageLayout(
          body: child,
          location: state.fullPath ?? Routes.taxiMain.path,
        );
      },
      routes: [
        GoRoute(
          path: Routes.taxiMain.path,
          parentNavigatorKey: _shellNavigatorKey,
          builder: (BuildContext context, GoRouterState state) {
            return Routes.taxiMain.screen;
          },
        ),
        GoRoute(
            path: Routes.messaging.path,
            parentNavigatorKey: _shellNavigatorKey,
            builder: (BuildContext context, GoRouterState state) {
              return Routes.messaging.screen;
            }),
        GoRoute(
            path: Routes.profile.path,
            parentNavigatorKey: _shellNavigatorKey,
            builder: (BuildContext context, GoRouterState state) {
              return Routes.profile.screen;
            }),
      ]),
  GoRoute(
    path: Routes.recruitment(':pageId').path,
    parentNavigatorKey: _rootNavigatorKey,
    builder: (BuildContext context, GoRouterState state) {
      return Routes.recruitment(state.pathParameters['pageId']!).screen;
    },
  ),
  GoRoute(
    path: Routes.login.path,
    builder: (context, state) => Routes.login.screen,
  ),
];
