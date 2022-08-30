import 'package:flutter/material.dart';

class CardListItem<T> {
  final String title;
  final Color titleColor;
  final Color bgColor;
  final T? data;
  CardListItem(
      {required this.title,
      required this.titleColor,
      required this.bgColor,
      this.data});
}
