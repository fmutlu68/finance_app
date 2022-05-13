import 'package:finance_app/core/extensions/navigation_extension.dart';
import 'package:finance_app/core/start/navigation/routes/navigation_route.dart';
import 'package:finance_app/production/constant/enum/currency_enum.dart';
import 'package:finance_app/view/home/markets/view/markets_view.dart';
import 'package:flutter/material.dart';

import 'package:finance_app/production/features/finance_data/models/req/parity_info.dart';
import 'package:finance_app/production/features/finance_data/models/res/parity.dart';

class ParityCard extends StatelessWidget {
  final Parity exParity;
  final Parity newParity;
  final ParityInfo parityInfo;
  final bool isUpdated;
  const ParityCard({
    Key? key,
    required this.exParity,
    required this.newParity,
    required this.parityInfo,
    required this.isUpdated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MarketCard(
      isUpdated: isUpdated,
      dailyGainAsPrice: newParity.dailyGainAsPrice!,
      cardSubtitleText: "${newParity.price}",
      cardTitleText: "${parityInfo.name} - ${parityInfo.info}",
      exDailyGain: exParity.dailyGain!,
      newDailyGain: newParity.dailyGain!,
      selectedCurrency: ExchangeCurrency.dollar,
      onClicked: () {
        context.navigate(
            NavigationRoute.navigateToParityItemDetail(parityInfo, newParity));
      },
    );
  }
}
