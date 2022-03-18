import 'package:finance_app/core/extensions/navigation_extension.dart';
import 'package:finance_app/core/extensions/theme_extension.dart';
import 'package:finance_app/core/start/navigation/routes/navigation_route.dart';
import 'package:flutter/material.dart';

import 'package:finance_app/production/features/finance_data/base/model/i_news.dart';

class CategoryNewsColumnItem<T extends INews> extends StatelessWidget {
  final T news;
  const CategoryNewsColumnItem({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print("Clicked");
          context.navigate(NavigationRoute.navigateToNewsDetail(news));
        },
        title: Text(news.title),
        subtitle: Text(
          news.date ?? "",
          style: context.textTheme.caption,
        ),
        leading: Hero(
          tag: news.link,
          child: Image.network(
            news.imageUrl,
            width: 80,
          ),
        ),
      ),
    );
  }
}
