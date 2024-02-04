import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:watso_v2/common/constants/styles.dart';
import 'package:watso_v2/taxi/pages/LoginPage.dart';
import 'package:watso_v2/taxi/pages/MainPage.dart';
import 'package:watso_v2/taxi/pages/RecruitmentPage.dart';

import 'common/widgets/Layout.dart';
import 'taxi/pages/MessagingPage.dart';

void main() {
  // 웹 환경에서 카카오 로그인을 정상적으로 완료하려면 runApp() 호출 전 아래 메서드 호출 필요
  WidgetsFlutterBinding.ensureInitialized();
  const kakaoOauthKey = String.fromEnvironment('Kakao_Oauth_Key');
  print('Kakao_Oauth_Key: $kakaoOauthKey');
  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: kakaoOauthKey,
  );
  runApp(const MyApp());
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: "/",
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    ShellRoute(
        navigatorKey: _shellNavigatorKey,
        pageBuilder: (BuildContext context, GoRouterState state, child) {
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
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginPage(),
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
