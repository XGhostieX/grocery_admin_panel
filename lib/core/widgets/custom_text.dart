import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double size;
  final bool isBold;
  final int? maxLines;
  final TextDecoration? decoration;
  final FontStyle? fontStyle;
  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.size = 16,
    this.isBold = false,
    this.maxLines,
    this.decoration,
    this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        decoration: decoration,
        fontStyle: fontStyle,
        fontSize: size,
        fontWeight: isBold ? FontWeight.bold : null,
        color: color,
        overflow: TextOverflow.ellipsis,
      ),
      maxLines: maxLines,
    );
  }
}
