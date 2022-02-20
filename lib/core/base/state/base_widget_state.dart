import 'package:finance_app/core/utils/laten.dart';
import 'package:flutter/material.dart';

abstract class BaseWidgetState extends StatelessWidget {
  BaseWidgetState({Key? key}) : super(key: key);
  final Laten<BuildContext> _context = Laten();

  BuildContext get context => _context.data!;
  void setContext(BuildContext newContext) {
    if (_context.isDataEmpty) {
      _context.setValue(newContext);
    }
  }

  Size get screenSize => MediaQuery.of(context).size;

  double calculateDynamicHeight(double percentage) =>
      (screenSize.height * percentage) / 100;

  double calculateDynamicWidth(double percentage) =>
      (screenSize.width * percentage) / 100;
}
