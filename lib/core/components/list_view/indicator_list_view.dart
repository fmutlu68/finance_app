import 'package:flutter/material.dart';
import '../../extensions/dynamic_size_extension.dart';

class IndicatorListView extends StatelessWidget {
  final int currentIndex;
  final int indicatorCount;
  final double? radius;
  final Axis indicatorListDirection;
  final Color unselectedIndicatorColor;
  final Color selectedIndicatorColor;
  final Widget? Function(BuildContext, bool)? indicatorChildBuilder;
  const IndicatorListView({
    Key? key,
    required this.currentIndex,
    required this.indicatorCount,
    this.indicatorListDirection = Axis.horizontal,
    this.unselectedIndicatorColor = Colors.transparent,
    this.selectedIndicatorColor = Colors.transparent,
    this.indicatorChildBuilder,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: indicatorCount,
      itemBuilder: buildAvatar,
      scrollDirection: indicatorListDirection,
      shrinkWrap: true,
    );
  }

  Padding buildAvatar(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: CircleAvatar(
        radius: radius ?? context.lowWidth,
        backgroundColor: currentIndex == index
            ? selectedIndicatorColor
            : unselectedIndicatorColor == Colors.transparent
                ? selectedIndicatorColor.withOpacity(0.3)
                : unselectedIndicatorColor,
        child: (indicatorChildBuilder ?? (_, __) => null)(
            context, currentIndex == index),
      ),
    );
  }
}
