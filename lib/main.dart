import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:watso_v2/common/constants/styles.dart';
import 'package:watso_v2/common/router/router.dart';

void main() {
  // 웹 환경에서 카카오 로그인을 정상적으로 완료하려면 runApp() 호출 전 아래 메서드 호출 필요
  WidgetsFlutterBinding.ensureInitialized();
  const kakaoOauthKey = String.fromEnvironment('Kakao_Oauth_Key');
  print('Kakao_Oauth_Key: $kakaoOauthKey');
  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: kakaoOauthKey,
  );
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myRouter = ref.watch(myRouterProvider);

    return MaterialApp.router(
        title: 'Watso',
        debugShowCheckedModeBanner: false,
        routerConfig: myRouter,
        theme: ThemeData(
          primaryColor: WatsoColor.primary,
          highlightColor: WatsoColor.primary,
          focusColor: WatsoColor.primary,
          fontFamily: 'NotoSans',
        ));
  }
}
