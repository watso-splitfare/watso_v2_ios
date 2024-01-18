import 'package:flutter/material.dart';

import '../constants/styles.dart';

class AngularBox extends StatelessWidget {
  const AngularBox(
      {super.key,
      required this.child,
      this.margin,
      this.padding,
      this.width,
      this.height});

  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      child: child,
    );
  }
}

class RoundBox extends StatelessWidget {
  const RoundBox(
      {super.key,
      required this.child,
      this.margin,
      this.padding,
      this.width,
      this.height});

  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      child: child,
    );
  }
}

class TextBox extends StatelessWidget {
  const TextBox({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Text(
          text,
          style: WatsoFont.mainBody,
        ),
      ),
    );
  }
}

class TileContentBox extends StatelessWidget {
  const TileContentBox(
      {super.key, required this.title, this.content, this.widget});

  final String title;
  final String? content;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: WatsoFont.tag,
        ),
        if (content != null)
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(content!, style: WatsoFont.mainBody),
          ),
        if (widget != null) widget!,
      ],
    );
  }
}
