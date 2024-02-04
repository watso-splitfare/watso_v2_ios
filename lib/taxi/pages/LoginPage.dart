import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import '../../common/constants/styles.dart';
import '../../common/widgets/Boxes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    //   kakao login
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Expanded(child: Container(color: WatsoColor.primary)),
            Expanded(child: Container(color: WatsoColor.background)),
          ],
        ),
        Center(
          child: RoundBox(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "로그인",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
                      print('카카오톡으로 로그인 성공 ${token.accessToken}');
                    } catch (error) {
                      print('카카오톡으로 로그인 실패 $error');
                    }
                  },
                  child: Text("카카오 로그인"),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
