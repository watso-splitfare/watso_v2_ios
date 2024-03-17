import 'package:flutter/material.dart';

import '../constants/styles.dart';

class PrimaryBtn extends StatelessWidget {
  const PrimaryBtn(
      {super.key,
      required this.text,
      this.onPressed,
      this.maximumSize,
      this.minimumSize,
      this.color = WatsoColor.primary});

  final String text;
  final VoidCallback? onPressed;
  final Size? maximumSize;
  final Size? minimumSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        elevation: 0,
        maximumSize: maximumSize,
        minimumSize: minimumSize,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: WatsoFont.subtitle.copyWith(color: Colors.white),
      ),
    );
  }
}
