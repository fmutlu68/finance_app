import 'package:flutter/material.dart';

class BaseWidget extends StatefulWidget {
  final Widget Function(BuildContext context) onWidgetBuilder;
  final VoidCallback? onWidgetInitalize;
  final VoidCallback? onWidgetDispose;
  const BaseWidget({
    Key? key,
    required this.onWidgetBuilder,
    this.onWidgetInitalize,
    this.onWidgetDispose,
  }) : super(key: key);

  @override
  _BaseWidgetState createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {
  @override
  void initState() {
    if (widget.onWidgetInitalize != null) widget.onWidgetInitalize!();
    super.initState();
  }

  @override
  void dispose() {
    if (widget.onWidgetDispose != null) widget.onWidgetDispose!();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onWidgetBuilder(context);
  }
}

/*
  final Widget Function() widgetBuilder;*/