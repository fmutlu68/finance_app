import 'package:finance_app/core/extensions/padding_extension.dart';
import 'package:finance_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

import 'package:finance_app/core/extensions/spacer_extension.dart';
import 'package:finance_app/production/features/finance_data/extension/date_extension.dart';
import 'package:finance_app/production/features/finance_data/models/res/calendar_data.dart';

class CalendarDataDetailDialog extends StatefulWidget {
  final CalendarData data;
  const CalendarDataDetailDialog({Key? key, required this.data})
      : super(key: key);

  @override
  State<CalendarDataDetailDialog> createState() =>
      _CalendarDataDetailDialogState();
}

class _CalendarDataDetailDialogState extends State<CalendarDataDetailDialog> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: context.veryLowSymPadding,
      insetPadding: context.veryLowSymPadding,
      title: buildTile(context, widget.data.country + " / " + widget.data.title,
          bgColor: context.theme.highlightColor),
      children: [
        context.veryLowHeightSpacer,
        buildTile(context,
            widget.data.date.dateAsStringFormatted + " " + widget.data.time),
        context.veryLowHeightSpacer,
        buildTile(context, "Beklenen", trailing: widget.data.expected),
        context.veryLowHeightSpacer,
        buildTile(context, "Açıklanan", trailing: widget.data.explained),
        context.veryLowHeightSpacer,
        buildTile(context, "Önceki", trailing: widget.data.previous),
        context.veryLowHeightSpacer,
      ],
    );
  }

  Widget buildTile(BuildContext context, String title,
      {String? trailing, String? subtitle, String? leading, Color? bgColor}) {
    return ListTile(
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: trailing != null ? Text(trailing) : null,
      leading: leading != null ? Text(leading) : null,
      tileColor: Colors.blueAccent,
    );
  }
}
