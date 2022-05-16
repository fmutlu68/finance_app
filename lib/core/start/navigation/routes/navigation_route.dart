import 'package:finance_app/production/features/finance_data/base/model/i_news.dart';
import 'package:finance_app/production/features/finance_data/models/req/commodity_info.dart';
import 'package:finance_app/production/features/finance_data/models/req/currency_info.dart';
import 'package:finance_app/production/features/finance_data/models/res/currency.dart';
import 'package:finance_app/view/home/markets/pages/market_item_details/commodity_item_detail_view.dart';
import 'package:finance_app/view/home/markets/pages/market_item_details/parity_item_detail_view.dart';
import 'package:finance_app/view/home/news/pages/category_news_list/view/category_news_list_view.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../production/features/finance_data/base/model/i_commodity.dart';
import '../../../../production/features/finance_data/models/req/parity_info.dart';
import '../../../../production/features/finance_data/models/res/parity.dart';
import '../../../../view/home/home/view/home_view.dart';
import '../../../../view/home/markets/pages/market_item_details/currency_item_detail_view.dart';
import '../../../../view/home/news/pages/news_content_detail/view/news_content_detail.dart';

part 'navigation_route.freezed.dart';

@freezed
class NavigationRoute with _$NavigationRoute {
  const factory NavigationRoute.navigateToHome() = NavigationRouteHome;
  const factory NavigationRoute.navigateToNewsDetail(INews news) =
      NavigationRouteNewsDetail;
  const factory NavigationRoute.navigateToCategoryNews(
      List<INews> news, String title) = NavigationRouteCategoryNews;
  const factory NavigationRoute.navigateToCurrencyItemDetail(
      CurrencyInfo info, Currency currency) = NavigationRouteCurrencyItemDetail;
  const factory NavigationRoute.navigateToParityItemDetail(
      ParityInfo info, Parity parity) = NavigationRouteParityItemDetail;
  const factory NavigationRoute.navigateToCommodityItemDetail(
          CommodityInfo info, ICommodity commodity) =
      NavigationRouteCommodityItemDetail;
  // const factory NavigationRoute.navigateToCurrencyItemDetail(
  //         CurrencyInfo info, Currency currency, ExchangeCurrency currencyType) =
  //     NavigationRouteCurrencyItemDetail;
}

extension NavigationPathExtension on NavigationRoute {
  String get path {
    // ignore: unnecessary_this
    return this.when<String>(
      navigateToHome: () => "/",
      navigateToNewsDetail: (_) => "/detail",
      navigateToCategoryNews: (_, __) => "/categorynews",
      navigateToCurrencyItemDetail: (_, __) => "/currencyitemdetail",
      navigateToParityItemDetail: (_, __) => "/parityitemdetail",
      navigateToCommodityItemDetail: (_, __) => "/commodityitemdetail",
    );
  }

  Widget get page {
    return when<Widget>(
      navigateToHome: () => const HomeView(),
      navigateToNewsDetail: (news) => NewsContentDetail(news: news),
      navigateToCategoryNews: (newsList, title) =>
          CategoryNewsList(newsList: newsList, title: title),
      navigateToCurrencyItemDetail: (info, currency) =>
          CurrencyItemDetailView(info: info, currency: currency),
      navigateToParityItemDetail: (ParityInfo info, Parity parity) {
        return ParityItemDetailView(info: info, parity: parity);
      },
      navigateToCommodityItemDetail:
          (CommodityInfo info, ICommodity commodity) {
        return CommodityItemDetailView(info: info, commodity: commodity);
      },
    );
  }
}
