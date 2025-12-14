import 'package:go_router/go_router.dart';

import '../../features/add product/presentation/views/add_product_view.dart';
import '../../features/dashboard/presentation/views/dashboard_view.dart';
import '../../features/orders/presentation/views/orders_view.dart';
import '../../features/products/presentation/views/products_view.dart';

abstract class AppRouter {
  static const kProductsView = '/products';
  static const kOrdersView = '/orders';
  static const kAddProductView = '/add-product';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const DashboardView()),
      GoRoute(path: kProductsView, builder: (context, state) => const ProductsView()),
      GoRoute(path: kOrdersView, builder: (context, state) => const OrdersView()),
      GoRoute(path: kAddProductView, builder: (context, state) => const AddProductView()),
    ],
  );
}
