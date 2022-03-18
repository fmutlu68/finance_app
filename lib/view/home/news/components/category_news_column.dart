import 'package:finance_app/core/extensions/border_radius_extension.dart';
import 'package:finance_app/core/extensions/padding_extension.dart';
import 'package:finance_app/core/extensions/theme_extension.dart';
import 'package:finance_app/view/home/news/components/category_news_column_item.dart';
import 'package:flutter/material.dart';

import 'package:finance_app/production/features/finance_data/base/model/i_news.dart';

class CategoryNewsColumn<T extends INews> extends StatelessWidget {
  final List<T> news;
  final String categoryName;
  final Color? bgColor;
  const CategoryNewsColumn({
    Key? key,
    required this.news,
    required this.categoryName,
    this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor ?? Colors.deepPurple,
        borderRadius: context.veryLowRadius,
      ),
      padding: context.veryLowSymPadding,
      width: double.infinity,
      child: buildItemList(context),
    );
  }

  Widget buildItemList(BuildContext context) {
    return Column(
      children: news.isEmpty
          ? [
              buildGoDetailTile(),
              Padding(
                padding: context.veryLowHeightPadding,
                child: Center(
                  child: CircularProgressIndicator(
                    color: context.colors.background,
                  ),
                ),
              )
            ]
          : [
              buildGoDetailTile(),
              ...news
                  .getRange(0, 5)
                  .map<Widget>((e) => CategoryNewsColumnItem<T>(news: e))
                  .toList(),
            ],
    );
  }

  Card buildGoDetailTile() {
    return Card(
      child: ListTile(
        leading: Text(categoryName),
        dense: true,
        trailing:
            IconButton(onPressed: () {}, icon: const Icon(Icons.open_in_new)),
      ),
    );
  }
}
