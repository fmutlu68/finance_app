import 'package:finance_app/production/features/finance_data/models/res/history/commodity_history.dart';
import 'package:finance_app/production/notifiers/commodity_provider.dart';
import 'package:flutter/material.dart';

import 'package:finance_app/production/features/finance_data/base/model/i_commodity.dart';
import 'package:finance_app/production/features/finance_data/models/req/commodity_info.dart';
import 'package:provider/provider.dart';

import '../../../../../core/base/state/base_view_state.dart';
import '../../../../../production/constant/enum/currency_enum.dart';
import '../market_item_detail/view/market_item_detail_view.dart';

class CommodityItemDetailView extends StatefulWidget {
  final CommodityInfo info;
  final ICommodity commodity;
  const CommodityItemDetailView(
      {Key? key, required this.info, required this.commodity})
      : super(key: key);

  @override
  State<CommodityItemDetailView> createState() =>
      _CommodityItemDetailViewState();
}

class _CommodityItemDetailViewState
    extends BaseViewState<CommodityItemDetailView> {
  @override
  Widget build(BuildContext context) {
    return MarketItemDetailView<CommodityInfo, ICommodity, CommodityHistory>(
      info: widget.info,
      currencyType: widget.info.nameToShow
                  ?.contains(ExchangeCurrency.turkishLira.symbol) ??
              false || widget.info.info == "Çeyrek Altın"
          ? ExchangeCurrency.turkishLira
          : ExchangeCurrency.dollar,
      exMarketItem: context
          .watch<CommodityProvider>()
          .exCommodities
          .firstWhere((element) => element.name == widget.commodity.name),
      newMarketItem: context
          .watch<CommodityProvider>()
          .newCommodities
          .firstWhere((element) => element.name == widget.commodity.name),
      isUpdated: context.watch<CommodityProvider>().isUpdated,
      parserModel: CommodityHistory(),
    );
  }
}
