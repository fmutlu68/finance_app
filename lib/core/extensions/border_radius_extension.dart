import 'package:flutter/material.dart';
import 'dynamic_size_extension.dart';

extension BorderRadiusExtension on BuildContext {
  BorderRadius get veryLowRadius => BorderRadius.circular(veryLowWidth);
  BorderRadius get lowRadius => BorderRadius.circular(lowWidth);
  BorderRadius get normalRadius => BorderRadius.circular(normalWidth);
  BorderRadius get mediumRadius => BorderRadius.circular(mediumWidth);
  BorderRadius get highRadius => BorderRadius.circular(highWidth);
}
