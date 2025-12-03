import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/responsive.dart';
import '../../../../../core/widgets/header.dart';
import '../../views_model/menu_controller.dart';
import 'products_gridview.dart';

class DashboardViewBody extends ConsumerWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Header(
              fct: () {
                ref.read(menuControllerProvider).controlDashboarkMenu();
              },
            ),
            const SizedBox(height: 16),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Responsive(
                        mobile: ProductsGridview(childAspectRatio: 1.25, crossAxisCount: 2),
                        desktop: ProductsGridview(childAspectRatio: 0.9, crossAxisCount: 4),
                      ),
                      // MyProductsHome(),
                      // SizedBox(height: defaultPadding),
                      // OrdersScreen(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
