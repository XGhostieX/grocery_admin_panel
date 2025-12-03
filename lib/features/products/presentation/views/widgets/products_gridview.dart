import 'package:flutter/material.dart';

import 'product_item.dart';

class ProductsGridview extends StatelessWidget {
  const ProductsGridview({super.key, this.crossAxisCount = 4, this.childAspectRatio = 1});
  final int crossAxisCount;
  final double childAspectRatio;
  // final bool isInMain;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 8,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        return const ProductItem();
      },
    );
  }
}
