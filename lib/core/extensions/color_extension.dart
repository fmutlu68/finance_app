import 'package:flutter/material.dart';

extension ColorStringExtension on String {
  Color get color {
    if (startsWith("#")) {
      String colorText = replaceAll("#", "");
      String hexcolor = "0xff$colorText";
      return Color(int.parse(hexcolor));
    }
    return Colors.transparent;
  }
}
