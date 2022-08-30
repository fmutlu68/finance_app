import 'dart:async';
import 'package:finance_app/core/extensions/dynamic_size_extension.dart';
import 'package:flutter/material.dart';

class AutoSliderList extends StatefulWidget {
  final List<Widget> children;
  final double? spacing;
  final double? slidingSpeed;
  final Axis? slideAxis;
  final int? slideCount;

  const AutoSliderList(
      {Key? key,
      required this.children,
      this.spacing,
      this.slidingSpeed,
      this.slideAxis,
      this.slideCount})
      : super(key: key);

  @override
  State<AutoSliderList> createState() => _AutoSliderListState();
}

class _AutoSliderListState extends State<AutoSliderList> {
  late ScrollController _sliderController;
  late Timer _sliderTimer;
  final Duration _updateDuration = const Duration(milliseconds: 100);
  final int _defaultSlideCount = 1000000000;

  @override
  void initState() {
    assert(widget.children.length > 1);
    _sliderController = ScrollController(initialScrollOffset: 0);
    _sliderTimer = _assignTimer();
    super.initState();
  }

  @override
  void dispose() {
    _sliderController.dispose();
    _sliderTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => _sliderTimer.cancel(),
      onLongPressEnd: (_) => _sliderTimer = _assignTimer(),
      child: AbsorbPointer(
        absorbing: true,
        child: ListView.separated(
          controller: _sliderController,
          shrinkWrap: true,
          physics: null,
          itemCount: widget.slideCount ?? _defaultSlideCount,
          cacheExtent: context.width,
          scrollDirection: widget.slideAxis ?? Axis.horizontal,
          itemBuilder: (context, index) =>
              widget.children[index % widget.children.length],
          separatorBuilder: (context, index) {
            if (widget.slideAxis == null) {
              return SizedBox(width: widget.spacing ?? 10);
            }
            return widget.slideAxis == Axis.horizontal
                ? SizedBox(width: widget.spacing ?? 10)
                : SizedBox(height: widget.spacing ?? 10);
          },
        ),
      ),
    );
  }

  Timer _assignTimer() {
    return Timer.periodic(
      _updateDuration,
      (_) {
        _sliderController.animateTo(
          _sliderController.offset + (widget.slidingSpeed ?? 10),
          duration: _updateDuration,
          curve: Curves.linear,
        );
      },
    );
  }
}
