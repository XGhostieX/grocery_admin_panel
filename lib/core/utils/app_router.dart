import 'package:go_router/go_router.dart';

import '../../features/dashboard/presentation/views/dashboard_view.dart';
<<<<<<< HEAD
import '../../features/orders/presentation/views/orders_view.dart';
import '../../features/products/presentation/views/products_view.dart';

abstract class AppRouter {
  static const kProductsView = '/products';
  static const kOrdersView = '/orders';
=======
import '../../features/products/presentation/views/products_view.dart';

abstract class AppRouter {
  static const kProductsView = '/Products';
>>>>>>> 05861db3193a205df9761511a9e7d61de81d610d

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const DashboardView()),
      GoRoute(path: kProductsView, builder: (context, state) => const ProductsView()),
<<<<<<< HEAD
      GoRoute(path: kOrdersView, builder: (context, state) => const OrdersView()),
=======
>>>>>>> 05861db3193a205df9761511a9e7d61de81d610d
    ],
  );
}
