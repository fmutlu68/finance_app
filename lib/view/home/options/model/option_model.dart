import 'package:flutter/material.dart';

class OptionModel {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onClicked;
  final Color? color;
  OptionModel({
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onClicked,
    this.color,
  });
}
