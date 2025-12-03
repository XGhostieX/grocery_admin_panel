import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_theme.dart';
import 'core/utils/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: GroceryAdminPanel()));
}

class GroceryAdminPanel extends ConsumerWidget {
  const GroceryAdminPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Grocery Admin Panel',
      debugShowCheckedModeBanner: false,
      theme: ref.watch(themeNotifierProvider),
      routerConfig: AppRouter.router,
    );
  }
}
