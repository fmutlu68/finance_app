import 'package:finance_app/core/base/widget/base_view.dart';
import 'package:finance_app/core/components/list_view/indicator_list_view.dart';
import 'package:finance_app/core/extensions/padding_extension.dart';
import 'package:finance_app/core/extensions/theme_extension.dart';
import 'package:finance_app/production/features/finance_data/models/res/bullonism_news.dart';
import 'package:finance_app/production/features/finance_data/models/res/crypto_news.dart';
import 'package:finance_app/production/features/finance_data/models/res/currency_news.dart';
import 'package:finance_app/production/features/finance_data/models/res/headline_news.dart';
import 'package:finance_app/production/notifiers/news_provider.dart';
import 'package:finance_app/view/home/news/components/category_news_column.dart';
import 'package:finance_app/view/home/news/components/headline_news_card.dart';
import 'package:finance_app/view/home/news/view_model/news_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../../production/features/finance_data/models/res/agenda_news.dart';
import '../../../../production/features/finance_data/models/res/stock_market_news.dart';

part '../components/headline_news_indicator_list.dart';

// ignore: must_be_immutable
class NewsView extends StatelessWidget {
  late NewsViewModel viewModel;
  NewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<NewsViewModel>(
      viewModel: NewsViewModel(),
      onModelReady: (model) {
        viewModel = model;
        viewModel.setContext(context);
        viewModel.init();
      },
      onPageBuilder: (context, model) => SafeArea(
        child: Scaffold(
          body: ListView(
            children: [
              _buildHeadlineNewsBar(context),
              if (context.read<NewsProvider>().headlines.isNotEmpty)
                _buildListIndicator(context),
              _buiildAgendaNewsBar(context),
              _buildCurrencyNewsBar(context),
              _buildCryptoNewsBar(context),
              _buildBullonismNewsBar(context),
              _buildStockMarketNewsBar(context),
            ],
          ),
        ),
      ),
      onDispose: () {},
    );
  }

  _buildHeadlineNewsBar(BuildContext context) {
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
        controller: viewModel.controller,
        onPageChanged: viewModel.updateIndex,
        itemCount: headlines.length,
        itemBuilder: (context, index) {
          return HeadlineNewsCard(news: headlines[index]);
        },
      ),
    );
  }

  get buildEmptyHeadlineBar => const SizedBox(height: 0, width: 0);

  _buildCurrencyNewsBar(BuildContext context) {
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

  _buildCryptoNewsBar(BuildContext context) {
    NewsProvider newsProvider = context.watch<NewsProvider>();
    return Padding(
      padding: context.veryLowSymPadding,
      child: CategoryNewsColumn<CryptoNews>(
        news: newsProvider.cryptoNews,
        categoryName: "Kripto Haberleri",
        bgColor: context.colors.primary,
      ),
    );
  }

  _buildBullonismNewsBar(BuildContext context) {
    NewsProvider newsProvider = context.watch<NewsProvider>();
    return Padding(
      padding: context.veryLowSymPadding,
      child: CategoryNewsColumn<BullonismNews>(
        news: newsProvider.bullonismNews,
        categoryName: "Değerli Metal Haberleri",
        bgColor: context.colors.primary,
      ),
    );
  }

  _buildStockMarketNewsBar(BuildContext context) {
    NewsProvider newsProvider = context.watch<NewsProvider>();
    return Padding(
      padding: context.veryLowSymPadding,
      child: CategoryNewsColumn<StockMarketNews>(
        news: newsProvider.stockMarketNews,
        categoryName: "Borsa Haberleri",
        bgColor: context.colors.primary,
      ),
    );
  }

  _buiildAgendaNewsBar(BuildContext context) {
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
