import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text.dart';

class OrderItem extends StatefulWidget {
  const OrderItem({super.key});

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).cardColor.withValues(alpha: 0.4),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: MediaQuery.sizeOf(context).width < 650 ? 3 : 1,
                child: CachedNetworkImage(
                  imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
                  fit: BoxFit.cover,
                  // height: screenWidth * 0.15,
                  // width: screenWidth * 0.15,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomText(text: '12x For \$19.9', size: 16, isBold: true),
                    FittedBox(
                      child: Row(
                        children: [
                          CustomText(text: 'By', color: Colors.blue, size: 16, isBold: true),
                          CustomText(text: '  Hadi K.', size: 14, isBold: true),
                        ],
                      ),
                    ),
                    Text('20/03/2022'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
