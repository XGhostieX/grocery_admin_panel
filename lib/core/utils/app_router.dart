import 'package:go_router/go_router.dart';

import '../../features/dashboard/presentation/views/dashboard_view.dart';
import '../../features/products/presentation/views/products_view.dart';

abstract class AppRouter {
  static const kProductsView = '/Products';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const DashboardView()),
      GoRoute(path: kProductsView, builder: (context, state) => const ProductsView()),
    ],
  );
}
