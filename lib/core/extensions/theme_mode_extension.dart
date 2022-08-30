import 'package:finance_app/core/models/components/list_view/card_list_item.dart';
import 'package:flutter/material.dart';

extension ThemeModeExtension on ThemeMode {
  String get theme {
    switch (this) {
      case ThemeMode.dark:
        return "DARK";
      case ThemeMode.light:
        return "LIGHT";
      default:
        return "LIGHT";
    }
  }

  CardListItem get itemInfo {
    switch (this) {
      case ThemeMode.system:
        return CardListItem(
            title: "Sistem",
            bgColor: Colors.blueGrey,
            titleColor: Colors.white);
      case ThemeMode.light:
        return CardListItem(
            title: "Aydınlık", bgColor: Colors.white, titleColor: Colors.black);
      case ThemeMode.dark:
        return CardListItem(
            title: "Karanlık", bgColor: Colors.black, titleColor: Colors.white);
    }
  }
}
