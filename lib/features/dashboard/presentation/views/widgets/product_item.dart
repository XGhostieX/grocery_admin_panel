import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).cardColor.withValues(alpha: 0.6),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 3,
                      child: CachedNetworkImage(
                        imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
                        // 'https://www.lifepng.com/wp-content/uploads/2020/11/Apricot-Large-Single-png-hd.png',
                        fit: BoxFit.cover,
                        // width: screenWidth * 0.12,
                        height: MediaQuery.sizeOf(context).width * 0.12,
                      ),
                    ),
                    const Spacer(),
                    PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(onTap: () {}, value: 1, child: const Text('Edit')),
                        PopupMenuItem(
                          onTap: () {},
                          value: 2,
                          child: const Text('Delete', style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                const Row(
                  children: [
                    CustomText(text: '\$1.99', size: 18),
                    SizedBox(width: 7),
                    Visibility(
                      visible: true,
                      child: Text(
                        '\$3.89',
                        style: TextStyle(decoration: TextDecoration.lineThrough),
                      ),
                    ),
                    Spacer(),
                    CustomText(text: '1Kg', size: 18),
                  ],
                ),
                const SizedBox(height: 2),
                const CustomText(text: 'Title', size: 24, isBold: true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
