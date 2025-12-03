import 'package:go_router/go_router.dart';

import '../../features/dashboard/presentation/views/dashboard_view.dart';

abstract class AppRouter {
  static const kDashboardView = '/dashboard';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const DashboardView()),
      GoRoute(path: kDashboardView, builder: (context, state) => const DashboardView()),
    ],
  );
}
