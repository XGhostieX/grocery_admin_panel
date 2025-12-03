import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/side_menu.dart';
import '../../../dashboard/presentation/views_model/menu_controller.dart';
import 'widgets/orders_view_body.dart';

class OrdersView extends ConsumerWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: ref.read(menuControllerProvider).getOrderscaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context)) const Expanded(child: SideMenu()),
            const Expanded(flex: 5, child: OrdersViewBody()),
          ],
        ),
      ),
    );
  }
}
