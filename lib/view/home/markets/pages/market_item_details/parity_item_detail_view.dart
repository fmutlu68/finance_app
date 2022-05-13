import 'package:finance_app/production/features/finance_data/models/res/parity_history.dart';
import 'package:finance_app/production/notifiers/parity_provider.dart';
import 'package:flutter/material.dart';

import 'package:finance_app/production/features/finance_data/models/req/parity_info.dart';
import 'package:finance_app/production/features/finance_data/models/res/parity.dart';
import 'package:provider/provider.dart';

import '../../../../../production/constant/enum/currency_enum.dart';
import '../market_item_detail/view/market_item_detail_view.dart';

class ParityItemDetailView extends StatefulWidget {
  final ParityInfo info;
  final Parity parity;
  const ParityItemDetailView(
      {Key? key, required this.info, required this.parity})
      : super(key: key);

  @override
  State<ParityItemDetailView> createState() => _ParityItemDetailViewState();
}

class _ParityItemDetailViewState extends State<ParityItemDetailView> {
  @override
  Widget build(BuildContext context) {
    return MarketItemDetailView<ParityInfo, Parity, ParityHistory>(
      info: widget.info,
      currencyType: ExchangeCurrency.dollar,
      marketItem: widget.parity,
      exMarketItem: context
          .watch<ParityProvider>()
          .exParities
          .firstWhere((element) => element.name == widget.parity.name),
      newMarketItem: context
          .watch<ParityProvider>()
          .newParities
          .firstWhere((element) => element.name == widget.parity.name),
      isUpdated: context.watch<ParityProvider>().isUpdated,
      parserModel: ParityHistory(),
    );
  }
}
