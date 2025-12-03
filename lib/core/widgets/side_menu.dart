import 'package:flutter/material.dart' hide ThemeMode;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

import '../utils/app_router.dart';
import 'custom_text.dart';
import '../theme/app_theme.dart';

class SideMenu extends ConsumerStatefulWidget {
  const SideMenu({super.key});

  @override
  ConsumerState<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends ConsumerState<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Image.asset("assets/images/groceries.png")),
          DrawerListTile(
            title: "Main",
            press: () => GoRouter.of(context).pushReplacement('/'),
            icon: Icons.home_filled,
          ),
          DrawerListTile(
            title: "View all product",
            press: () => GoRouter.of(context).pushReplacement(AppRouter.kProductsView),
            icon: Icons.store,
          ),
<<<<<<< HEAD
          DrawerListTile(
            title: "View all order",
            press: () => GoRouter.of(context).pushReplacement(AppRouter.kOrdersView),
            icon: IconlyBold.bag_2,
          ),
=======
          DrawerListTile(title: "View all order", press: () {}, icon: IconlyBold.bag_2),
>>>>>>> 05861db3193a205df9761511a9e7d61de81d610d
          SwitchListTile(
            title: const CustomText(text: 'Dark Theme'),
            secondary: const Icon(Icons.dark_mode_rounded),
            value: ref.watch(themeNotifierProvider.notifier).mode == ThemeMode.dark,
            onChanged: (value) => setState(() {
              ref.watch(themeNotifierProvider.notifier).toggleTheme();
            }),
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({super.key, required this.title, required this.press, required this.icon});

  final String title;
  final VoidCallback press;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(icon, size: 18),
      title: CustomText(text: title),
    );
  }
}
