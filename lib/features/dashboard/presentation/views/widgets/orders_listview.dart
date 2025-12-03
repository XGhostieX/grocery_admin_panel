import 'package:flutter/material.dart';

import 'order_item.dart';

class OrdersListview extends StatelessWidget {
  const OrdersListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) => const OrderItem(),
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}
