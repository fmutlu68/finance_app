import 'package:finance_app/core/extensions/border_radius_extension.dart';
import 'package:finance_app/core/extensions/dynamic_size_extension.dart';
import 'package:finance_app/core/extensions/navigation_extension.dart';
import 'package:finance_app/core/extensions/spacer_extension.dart';
import 'package:finance_app/core/extensions/theme_extension.dart';
import 'package:finance_app/core/start/navigation/routes/navigation_route.dart';
import 'package:flutter/material.dart';

import 'package:finance_app/production/features/finance_data/models/res/headline_news.dart';

class HeadlineNewsCard extends StatelessWidget {
  final HeadlineNews news;
  const HeadlineNewsCard({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.navigate(NavigationRoute.navigateToNewsDetail(news));
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.veryLowHeight,
            horizontal: context.veryLowWidth,
          ),
          child: SafeArea(
            child: Column(
              children: [
                Hero(
                  tag: news.link,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(news.imageUrl),
                        fit: BoxFit.contain,
                      ),
                      borderRadius: context.veryLowRadius,
                    ),
                    width: double.infinity,
                    height: 150,
                  ),
                ),
                context.veryLowHeightSpacer,
                ListTile(
                  dense: true,
                  title: Text(news.title),
                  subtitle: Text(news.date ?? ""),
                  tileColor: context.colors.background,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
