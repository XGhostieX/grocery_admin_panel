import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/responsive.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/elevated_btn.dart';
import '../../../../../core/widgets/header.dart';
import '../../views_model/menu_controller.dart';
import 'orders_listview.dart';
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
              title: 'Dashboard',
              fct: () {
                ref.read(menuControllerProvider).controlDashboardMenu();
              },
            ),
            const CustomText(text: 'Latest Products'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedBtn(
                    icon: Icons.store_rounded,
                    title: 'View All',
                    bgColor: Colors.blue,
                    fgColor: Colors.white,
                    function: () {},
                  ),
                  ElevatedBtn(
                    icon: Icons.add_rounded,
                    title: 'Add Product',
                    bgColor: Colors.blue,
                    fgColor: Colors.white,
                    function: () => GoRouter.of(context).push(AppRouter.kAddProductView),
                  ),
                ],
              ),
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
                      OrdersListview(),
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
