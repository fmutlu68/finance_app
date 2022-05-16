import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:finance_app/core/extensions/lang_extension.dart';
import 'package:finance_app/core/start/lang/locale_keys.g.dart';
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
      borderRadius: const Radius.circular(5),
      items: [
        CustomNavigationBarItem(
          icon: const Icon(UniconsSolid.chart),
          selectedTitle: Text(LocaleKeys.bottomBar_firstItem.locale),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Icons.dashboard),
          selectedTitle: Text(LocaleKeys.bottomBar_secondItem.locale),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Icons.newspaper),
          selectedTitle: Text(LocaleKeys.bottomBar_thirdItem.locale),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Icons.account_balance_wallet),
          selectedTitle: Text(LocaleKeys.bottomBar_fourthItem.locale),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Icons.settings),
          selectedTitle: Text(LocaleKeys.bottomBar_fifthItem.locale),
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
