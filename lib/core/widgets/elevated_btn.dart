import 'package:flutter/material.dart';

import '../utils/responsive.dart';
import 'custom_text.dart';

class ElevatedBtn extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback function;
  final Color? bgColor;
  final Color? fgColor;
  final double width;
  final double height;
  const ElevatedBtn({
    super.key,
    required this.icon,
    required this.title,
    required this.function,
    this.bgColor,
    this.fgColor,
    this.width = 50,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: function,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: 16 * 1.5,
          vertical: 16 / (Responsive.isDesktop(context) ? 1 : 2),
        ),
        minimumSize: Size(width, height),
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      label: CustomText(text: title, size: 20),
    );
  }
}
