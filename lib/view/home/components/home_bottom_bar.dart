import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import 'package:finance_app/core/extensions/theme_extension.dart';

class HomeBottomBar extends StatefulWidget {
  final void Function(int) onPageChanged;
  final int selectedPageIndex;
  const HomeBottomBar({
    Key? key,
    required this.onPageChanged,
    required this.selectedPageIndex,
  }) : super(key: key);

  @override
  State<HomeBottomBar> createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  @override
  Widget build(BuildContext context) {
    return CustomNavigationBar(
      iconSize: 30.0,
      selectedColor: context.theme.bottomNavigationBarTheme.selectedItemColor,
      strokeColor: context.theme.bottomAppBarColor,
      unSelectedColor:
          context.theme.bottomNavigationBarTheme.unselectedItemColor,
      backgroundColor: context.theme.bottomNavigationBarTheme.backgroundColor!,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(5),
        topRight: Radius.circular(5),
      ),
      items: [
        CustomNavigationBarItem(
          icon: const Icon(UniconsSolid.chart),
          selectedTitle: const Text("Piyasalar"),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Icons.dashboard),
          selectedTitle: const Text("Veriler"),
        ),
        CustomNavigationBarItem(
          icon: const Icon(UniconsLine.paperclip),
          selectedTitle: const Text("Haberler"),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Icons.account_balance_wallet),
          selectedTitle: const Text("Portfolyom"),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Icons.settings),
          selectedTitle: const Text("Seçenekler"),
        ),
      ],
      currentIndex: widget.selectedPageIndex,
      onTap: changeIndex,
    );
  }

  changeIndex(int i) {
    widget.onPageChanged(i);
  }
}
