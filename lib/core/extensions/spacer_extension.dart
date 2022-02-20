import 'package:flutter/material.dart';
import 'dynamic_size_extension.dart';

extension SpacerExtension on BuildContext {
  SizedBox get veryLowHeightSpacer => SizedBox(
        height: veryLowHeight,
      );
  SizedBox get lowHeightSpacer => SizedBox(
        height: lowHeight,
      );
  SizedBox get normalHeightSpacer => SizedBox(
        height: normalHeight,
      );
  SizedBox get mediumHeightSpacer => SizedBox(
        height: mediumHeight,
      );
  SizedBox get highHeightSpacer => SizedBox(
        height: highHeight,
      );
  SizedBox get veryHighHeightSpacer => SizedBox(
        height: veryHighHeight,
      );

  SizedBox get veryLowWidthSpacer => SizedBox(
        width: veryLowWidth,
      );
  SizedBox get lowWidthSpacer => SizedBox(
        width: lowWidth,
      );
  SizedBox get normalWidthSpacer => SizedBox(
        width: normalWidth,
      );
  SizedBox get mediumWidthSpacer => SizedBox(
        width: mediumWidth,
      );
  SizedBox get highWidthSpacer => SizedBox(
        width: highWidth,
      );
  SizedBox get veryHighWidthSpacer => SizedBox(
        width: veryHighWidth,
      );
}
