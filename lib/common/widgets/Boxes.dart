import 'package:flutter/material.dart';

class OutlineBox extends StatelessWidget {
  const OutlineBox(
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
        border: Border.all(
          color: Colors.black,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      child: child,
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
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        if (content != null) Text(content!),
        if (widget != null) widget!,
      ],
    );
  }
}
