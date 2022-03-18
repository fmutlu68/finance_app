import 'package:finance_app/core/extensions/padding_extension.dart';
import 'package:finance_app/core/extensions/theme_extension.dart';
import 'package:finance_app/production/features/finance_data/models/res/currency_news.dart';
import 'package:finance_app/production/features/finance_data/models/res/headline_news.dart';
import 'package:finance_app/production/notifiers/news_provider.dart';
import 'package:finance_app/view/home/news/components/category_news_column.dart';
import 'package:finance_app/view/home/news/components/headline_news_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../production/features/finance_data/models/res/agenda_news.dart';

class NewsView extends StatelessWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            buildHeadlineNewsBar(context),
            buiildAgendaNewsBar(context),
            buiildCurrencyNewsBar(context),
          ],
        ),
      ),
    );
  }

  buildHeadlineNewsBar(BuildContext context) {
    NewsProvider newsProvider = context.watch<NewsProvider>();
    return newsProvider.headlines.isEmpty
        ? buildEmptyHeadlineBar
        : buildHeadlinesBar(context, newsProvider.headlines);
  }

  buildHeadlinesBar(BuildContext context, List<HeadlineNews> headlines) {
    return SizedBox(
      height: 280,
      width: double.infinity,
      child: PageView.builder(
        itemCount: headlines.length,
        itemBuilder: (context, index) {
          return HeadlineNewsCard(news: headlines[index]);
        },
      ),
    );
  }

  get buildEmptyHeadlineBar => const SizedBox(height: 0, width: 0);

  buiildCurrencyNewsBar(BuildContext context) {
    NewsProvider newsProvider = context.watch<NewsProvider>();
    return Padding(
      padding: context.veryLowSymPadding,
      child: CategoryNewsColumn<CurrencyNews>(
        news: newsProvider.currencyNews,
        categoryName: "Döviz Haberleri",
        bgColor: context.colors.primary,
      ),
    );
  }

  buiildAgendaNewsBar(BuildContext context) {
    NewsProvider newsProvider = context.watch<NewsProvider>();
    return Padding(
      padding: context.veryLowSymPadding,
      child: CategoryNewsColumn<AgendaNews>(
        news: newsProvider.agendaNews
          ..removeWhere((element) => newsProvider.headlines
              .any((headline) => headline.link == element.link)),
        categoryName: "Gündem Haberleri",
        bgColor: context.colors.primary,
      ),
    );
  }
}
