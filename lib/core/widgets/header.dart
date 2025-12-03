import 'package:flutter/material.dart';

import '../utils/responsive.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.fct});

  final Function fct;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              fct();
            },
          ),
        if (Responsive.isDesktop(context))
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Dashboard", style: Theme.of(context).textTheme.titleLarge),
          ),
        if (Responsive.isDesktop(context)) Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search",
              fillColor: Theme.of(context).cardColor,
              filled: true,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              suffixIcon: InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(16 * 0.75),
                  margin: const EdgeInsets.symmetric(horizontal: 16 / 2),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Icon(Icons.search, size: 25),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
