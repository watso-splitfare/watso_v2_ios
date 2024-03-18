import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import '../../common/constants/styles.dart';
import '../../common/widgets/Boxes.dart';

// var options = BaseOptions(
//   //https://
//   baseUrl: 'http://222.116.20.108:8000/api',
//   connectTimeout: Duration(seconds: 5),
//   receiveTimeout: Duration(seconds: 5),
// );
//
// Dio dio = Dio(options);

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "로그인",
                    textAlign: TextAlign.center,
                    style: WatsoFont.title,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: WatsoColor.primary,
                    ),
                    onPressed: () async {
                      try {
                        OAuthToken token =
                            await UserApi.instance.loginWithKakaoTalk();
                        print('카카오톡으로 로그인 성공 ${token.accessToken}');
                        print(token.idToken);
                        // var response = await dio
                        //     .get('/auth/kakao-login', queryParameters: {
                        //   'access_token': token.accessToken,
                        // });
                        // print(response.data);
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
        ),
      ]),
    );
  }
}
