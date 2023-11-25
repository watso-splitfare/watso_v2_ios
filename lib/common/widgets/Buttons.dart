import 'package:flutter/material.dart';

import '../constants/styles.dart';

class PrimaryBtn extends StatelessWidget {
  const PrimaryBtn(
      {super.key,
      required this.text,
      this.onPressed,
      this.maximumSize,
      this.minimumSize});

  final String text;
  final VoidCallback? onPressed;
  final Size? maximumSize;
  final Size? minimumSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: WatsoColor.primary,
        elevation: 0,
        maximumSize: maximumSize,
        minimumSize: minimumSize,
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
