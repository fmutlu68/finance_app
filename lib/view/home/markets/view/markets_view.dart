import 'package:finance_app/production/constant/enum/currency_enum.dart';
import 'package:finance_app/production/features/finance_data/base/model/i_commodity.dart';
import 'package:finance_app/production/features/finance_data/base/model/info_model.dart';
import 'package:finance_app/production/features/finance_data/base/model/response_model.dart';
import 'package:finance_app/production/features/finance_data/models/req/commodity_info.dart';
import 'package:finance_app/production/notifiers/commodity_provider.dart';
import 'package:finance_app/production/notifiers/currency_provider.dart';
import 'package:flutter/material.dart';

import 'package:finance_app/core/base/widget/base_view.dart';
import 'package:finance_app/core/extensions/theme_extension.dart';
import 'package:finance_app/production/features/finance_data/models/req/currency_info.dart';
import 'package:finance_app/production/features/finance_data/models/res/currency.dart';
import 'package:finance_app/view/home/markets/view_model/markets_view_model.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';

part '../components/currency_card.dart';
part '../components/commodity_card.dart';
part '../components/markets_items_list.dart';
part '../components/market_card.dart';

class MarketsView extends StatefulWidget {
  const MarketsView({
    Key? key,
  }) : super(key: key);

  @override
  State<MarketsView> createState() => _MarketsViewState();
}

class _MarketsViewState extends State<MarketsView>
    with TickerProviderStateMixin {
  late MarketsViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<MarketsViewModel>(
      viewModel: MarketsViewModel(),
      onModelReady: (model) async {
        viewModel = model;
        viewModel.setContext(context);
        viewModel.init();
        viewModel.initTabController(this);
      },
      onPageBuilder: (context, model) => DefaultTabController(
        length: 4,
        child: SafeArea(
          child: Scaffold(
            appBar: TabBar(
              controller: viewModel.marketsTabController,
              tabs: const [
                Tab(
                  icon: Icon(UniconsLine.dollar_alt),
                ),
                Tab(
                  icon: Icon(UniconsLine.gold),
                ),
                Tab(
                  icon: Icon(UniconsLine.chart_line),
                ),
                Tab(
                  icon: Icon(UniconsLine.bitcoin),
                ),
              ],
            ),
            body: TabBarView(
              children: [
                buildCurrenciesListChecker,
                buildCommoditiesListChecker,
                buildCurrenciesListChecker,
                buildCommoditiesListChecker
              ],
              controller: viewModel.marketsTabController,
            ),
          ),
        ),
      ),
    );
  }

  Widget get buildCurrenciesListChecker {
    CurrencyProvider _currencyProvider = context.watch<CurrencyProvider>();
    return _currencyProvider.newCurrencies.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : buildCurrencyList(
            _currencyProvider.isUpdated,
            _currencyProvider.currencyInfos,
            _currencyProvider.exCurrencies,
            _currencyProvider.newCurrencies,
          );
  }

  Widget get buildCommoditiesListChecker {
    CommodityProvider _commodityProvider = context.watch<CommodityProvider>();
    if (_commodityProvider.newCommodities.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return buildCommodityList(
        _commodityProvider.isUpdated,
        _commodityProvider.commodityInfos,
        _commodityProvider.exCommodities,
        _commodityProvider.newCommodities,
      );
    }
  }

  Widget buildCommodityList(bool isUpdated, List<CommodityInfo> infos,
      List<ICommodity> exCommodities, List<ICommodity> newCommodities) {
    return MarketsItemsList<CommodityInfo, ICommodity>(
      marketItemsInfos: infos,
      exMarketItems: exCommodities,
      newMarketItems: newCommodities,
      isUpdated: isUpdated,
      buildCard: (info, exItem, newItem, isUpdated) => CommodityCard(
          exCommodity: exItem,
          newCommodity: newItem,
          commodityInfo: info,
          isUpdated: isUpdated),
    );
  }

  Widget buildCurrencyList(bool isUpdated, List<CurrencyInfo> infos,
      List<Currency> exCurrencies, List<Currency> newCurrencies) {
    return MarketsItemsList<CurrencyInfo, Currency>(
      marketItemsInfos: infos,
      exMarketItems: exCurrencies,
      newMarketItems: newCurrencies,
      isUpdated: isUpdated,
      buildCard: (info, exItem, newItem, isUpdated) => CurrencyCard(
          exCurrency: exItem,
          newCurrency: newItem,
          currencyInfo: info,
          isUpdated: isUpdated),
    );
  }
}
