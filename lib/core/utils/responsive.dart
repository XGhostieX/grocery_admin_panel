import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;

  const Responsive({super.key, required this.mobile, required this.desktop});

  // This isMobile, isDesktop help us later
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 850;

  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    // If our width is more than 1100 then we consider it a desktop
    if (MediaQuery.sizeOf(context).width >= 1100) {
      return desktop;
    }
    // If width it less then 1100 and more then 850 we consider it as tablet
    // Or less then that we called it mobile
    else {
      return mobile;
    }
  }
}
