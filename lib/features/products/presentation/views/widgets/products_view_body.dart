import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/responsive.dart';
import '../../../../../core/widgets/header.dart';
<<<<<<< HEAD
import '../../../../dashboard/presentation/views/widgets/products_gridview.dart';
import '../../../../dashboard/presentation/views_model/menu_controller.dart';
=======
import '../../../../dashboard/presentation/views_model/menu_controller.dart';
import 'products_gridview.dart';
>>>>>>> 05861db3193a205df9761511a9e7d61de81d610d

class ProductsViewBody extends ConsumerWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Header(
              fct: () {
                ref.read(menuControllerProvider).controlProductsMenu();
              },
            ),
            const SizedBox(height: 16),
<<<<<<< HEAD
            const Responsive(
              mobile: ProductsGridview(childAspectRatio: 1.25, crossAxisCount: 2),
              desktop: ProductsGridview(childAspectRatio: 0.9, crossAxisCount: 4),
=======
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
                    ],
                  ),
                ),
              ],
>>>>>>> 05861db3193a205df9761511a9e7d61de81d610d
            ),
          ],
        ),
      ),
    );
  }
}
