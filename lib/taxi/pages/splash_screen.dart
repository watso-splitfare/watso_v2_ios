import 'package:flutter/material.dart';
import 'package:watso_v2/common/constants/styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: WatsoColor.primary,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "왓소 실행중..",
              style: WatsoFont.title,
            ),
            LinearProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
