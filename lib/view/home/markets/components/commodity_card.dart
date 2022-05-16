part of '../view/markets_view.dart';

class CommodityCard extends StatelessWidget {
  final ICommodity exCommodity;
  final ICommodity newCommodity;
  final CommodityInfo commodityInfo;
  final bool isUpdated;
  const CommodityCard({
    Key? key,
    required this.exCommodity,
    required this.newCommodity,
    required this.commodityInfo,
    required this.isUpdated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MarketCard(
      isUpdated: isUpdated,
      dailyGainAsPrice: newCommodity.dailyGainAsPrice!,
      cardSubtitleText: "${newCommodity.price}",
      cardTitleText:
          "${commodityInfo.hideName == true ? "" : (commodityInfo.nameToShow ?? commodityInfo.name) + " - "}${commodityInfo.info}",
      exDailyGain: exCommodity.dailyGain!,
      newDailyGain: newCommodity.dailyGain!,
      selectedCurrency: commodityInfo.nameToShow
                  ?.contains(ExchangeCurrency.turkishLira.symbol) ??
              false
          ? ExchangeCurrency.turkishLira
          : ExchangeCurrency.dollar,
      onClicked: () {
        context.navigate(NavigationRoute.navigateToCommodityItemDetail(
            commodityInfo, newCommodity));
      },
    );
    // return Card(
    //   child: ListTile(
    //     onTap: () {},
    //     title: Text(
    //       "${commodityInfo.hideName == true ? "" : (commodityInfo.nameToShow ?? commodityInfo.name) + " - "}${commodityInfo.info}",
    //       style: getTitleStyle(context),
    //     ),
    //     subtitle: Text("${newCommodity.price}"),
    //     leading: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         buildCurrencyIndicator(context),
    //       ],
    //     ),
    //     trailing: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         buildDailyGain(context),
    //         buildDailyGainAsTL(context),
    //       ],
    //     ),
    //     minLeadingWidth: 0,
    //   ),
    // );
  }

  Icon buildCurrencyIndicator(BuildContext context) {
    return newCommodity.dailyGainAsPrice! == "\$0,00"
        ? const Icon(Icons.trending_flat)
        : (newCommodity.dailyGain ?? 0.00) < 0.00
            ? const Icon(
                Icons.trending_down,
                color: Colors.red,
              )
            : const Icon(
                Icons.trending_up,
                color: Colors.green,
              );
  }

  Text buildDailyGain(BuildContext context) {
    return Text(
      "%${newCommodity.dailyGain!.toStringAsFixed(2)}",
      style: TextStyle(
        color:
            (newCommodity.dailyGain ?? 0.00) < 0.00 ? Colors.red : Colors.green,
      ),
    );
  }

  Text buildDailyGainAsTL(BuildContext context) {
    if (newCommodity.dailyGainAsPrice!.contains("0,00")) {
      newCommodity.dailyGainAsPrice =
          newCommodity.dailyGainAsPrice!.replaceAll("-", "");
    }
    return Text(
      newCommodity.dailyGainAsPrice!,
      style: TextStyle(
        color: newCommodity.dailyGain! < 0.00 &&
                newCommodity.dailyGainAsPrice! != "₺0,00"
            ? Colors.red
            : newCommodity.dailyGainAsPrice! == "₺0,00"
                ? context.colors.onSurface
                : Colors.green,
      ),
    );
  }

  getTitleStyle(BuildContext context) {
    return isUpdated
        ? exCommodity.dailyGain! == newCommodity.dailyGain!
            ? const TextStyle()
            : TextStyle(
                color: exCommodity.dailyGain! < newCommodity.dailyGain!
                    ? Colors.green
                    : Colors.red,
              )
        : null;
  }
}
