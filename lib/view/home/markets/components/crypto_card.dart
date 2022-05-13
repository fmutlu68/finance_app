import 'package:finance_app/production/constant/enum/currency_enum.dart';
import 'package:flutter/material.dart';

import 'package:finance_app/production/features/finance_data/models/req/crypto_info.dart';
import 'package:finance_app/production/features/finance_data/models/res/crypto.dart';
import 'package:finance_app/view/home/markets/view/markets_view.dart';

class CryptoCard extends StatelessWidget {
  final Crypto exCrypto;
  final Crypto newCrypto;
  final CryptoInfo cryptoInfo;
  final bool isUpdated;
  const CryptoCard({
    Key? key,
    required this.exCrypto,
    required this.newCrypto,
    required this.cryptoInfo,
    required this.isUpdated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MarketCard(
      isUpdated: isUpdated,
      dailyGainAsPrice: newCrypto.dailyGainAsPrice!,
      cardSubtitleText: "${newCrypto.price}",
      cardTitleText: "${newCrypto.name} - ${cryptoInfo.info}",
      exDailyGain: exCrypto.dailyGain!,
      newDailyGain: newCrypto.dailyGain!,
      selectedCurrency: ExchangeCurrency.dollar,
      onClicked: () {
        // context.navigate(
        //     NavigationRoute.navigateToParityItemDetail(, newParity));
      },
    );
  }
}
