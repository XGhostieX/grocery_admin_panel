import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/responsive.dart';
import '../../../../../core/widgets/header.dart';
import '../../../../dashboard/presentation/views/widgets/products_gridview.dart';
import '../../../../dashboard/presentation/views_model/menu_controller.dart';

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
              title: 'Products',
              fct: () {
                ref.read(menuControllerProvider).controlProductsMenu();
              },
            ),
            const SizedBox(height: 16),
            const Responsive(
              mobile: ProductsGridview(childAspectRatio: 1.25, crossAxisCount: 2),
              desktop: ProductsGridview(childAspectRatio: 0.9, crossAxisCount: 4),
            ),
          ],
        ),
      ),
    );
  }
}
