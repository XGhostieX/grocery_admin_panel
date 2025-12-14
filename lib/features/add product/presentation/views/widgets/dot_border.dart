import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../../../../core/widgets/custom_text.dart';

class DotBorder extends StatelessWidget {
  const DotBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: RectDottedBorderOptions(
        dashPattern: [6.7],
        borderPadding: const EdgeInsets.all(8),

        color: Theme.of(context).textTheme.bodyLarge!.color!,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.image_outlined, size: 50),
            const SizedBox(height: 20),
            TextButton(
              onPressed: (() {}),
              child: const CustomText(text: 'Choose an image', color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
