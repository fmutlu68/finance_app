import 'package:finance_app/core/base/state/base_view_state.dart';
import 'package:finance_app/production/constant/enum/currency_enum.dart';
import 'package:finance_app/production/features/finance_data/models/res/currency_history.dart';
import 'package:finance_app/production/notifiers/currency_provider.dart';
import 'package:finance_app/view/home/markets/pages/market_item_detail/view/market_item_detail_view.dart';
import 'package:flutter/material.dart';

import 'package:finance_app/production/features/finance_data/models/req/currency_info.dart';
import 'package:finance_app/production/features/finance_data/models/res/currency.dart';
import 'package:provider/provider.dart';

class CurrencyItemDetailView extends StatefulWidget {
  final CurrencyInfo info;
  final Currency currency;
  const CurrencyItemDetailView(
      {Key? key, required this.info, required this.currency})
      : super(key: key);

  @override
  State<CurrencyItemDetailView> createState() => _CurrencyItemDetailViewState();
}

class _CurrencyItemDetailViewState
    extends BaseViewState<CurrencyItemDetailView> {
  @override
  Widget build(BuildContext context) {
    return MarketItemDetailView<CurrencyInfo, Currency, CurrencyHistory>(
      info: widget.info,
      currencyType: ExchangeCurrency.turkishLira,
      marketItem: widget.currency,
      exMarketItem: context
          .watch<CurrencyProvider>()
          .exCurrencies
          .firstWhere((element) => element.name == widget.currency.name),
      newMarketItem: context
          .watch<CurrencyProvider>()
          .newCurrencies
          .firstWhere((element) => element.name == widget.currency.name),
      isUpdated: context.watch<CurrencyProvider>().isUpdated,
      parserModel: CurrencyHistory(),
    );
  }
}
