import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/widgets/header.dart';
import '../../../../dashboard/presentation/views/widgets/orders_listview.dart';
import '../../../../dashboard/presentation/views_model/menu_controller.dart';

class OrdersViewBody extends ConsumerWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Header(
              title: 'Orders',
              fct: () {
                ref.read(menuControllerProvider).controlOrdersMenu();
              },
            ),
            const SizedBox(height: 16),
            const OrdersListview(),
          ],
        ),
      ),
    );
  }
}
