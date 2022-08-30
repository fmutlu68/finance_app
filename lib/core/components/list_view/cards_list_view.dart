import 'package:finance_app/core/extensions/spacer_extension.dart';
import 'package:finance_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

import 'package:finance_app/core/extensions/border_radius_extension.dart';
import 'package:finance_app/core/extensions/padding_extension.dart';
import 'package:finance_app/core/models/components/list_view/card_list_item.dart';

class CardsListView<T> extends StatefulWidget {
  final List<CardListItem<T>> items;
  final Color selectedItemBorderColor, bgColor, unSelectedItemBorderColor;
  final void Function(CardListItem<T> item) onSelectedItemChanged;
  final CardListItem? selectedItem;
  final double? borderWidth;
  final T? selectedValue;
  final String text;
  final bool itemStyleIsChip;
  const CardsListView({
    super.key,
    required this.items,
    required this.selectedItemBorderColor,
    required this.unSelectedItemBorderColor,
    required this.bgColor,
    required this.onSelectedItemChanged,
    required this.text,
    this.itemStyleIsChip = false,
    this.selectedValue,
    this.selectedItem,
    this.borderWidth,
  });

  @override
  State<CardsListView<T>> createState() => _CardsListViewState<T>();
}

class _CardsListViewState<T> extends State<CardsListView<T>> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.veryLowSymPadding,
      color: widget.bgColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              widget.text,
              style: context.textTheme.titleSmall,
              textAlign: TextAlign.left,
            ),
          ),
          context.veryLowHeightSpacer,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: widget.items
                .map<Widget>((e) => widget.itemStyleIsChip
                    ? buildListItemChip(
                        e,
                        widget.selectedItem?.title == e.title ||
                            widget.selectedValue == e.data)
                    : buildListItemCard(
                        e,
                        widget.selectedItem?.title == e.title ||
                            widget.selectedValue == e.data))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget buildListItemCard(CardListItem<T> item, bool isSelected) {
    return InkWell(
      onTap: () => widget.onSelectedItemChanged(item),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: context.veryLowRadius,
          border: Border.all(
              color: isSelected
                  ? widget.selectedItemBorderColor
                  : widget.unSelectedItemBorderColor,
              width: widget.borderWidth ?? 2),
          color: item.bgColor,
        ),
        child: Center(
            child: Text(item.title, style: TextStyle(color: item.titleColor))),
        padding: context.lowSymPadding,
      ),
    );
  }

  buildListItemChip(CardListItem<T> item, bool isSelected) {
    return ChoiceChip(
      label: Text(item.title,
          style:
              context.textTheme.bodyMedium?.copyWith(color: item.titleColor)),
      selected: isSelected,
      backgroundColor: item.bgColor,
      selectedColor: item.bgColor.withOpacity(.5),
      onSelected: (value) => widget.onSelectedItemChanged(item),
      shape: StadiumBorder(
        side: BorderSide(
            color: isSelected
                ? widget.selectedItemBorderColor
                : widget.unSelectedItemBorderColor,
            width: widget.borderWidth ?? 2),
      ),
    );
  }
}
