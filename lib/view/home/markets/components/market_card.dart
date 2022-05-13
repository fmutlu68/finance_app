part of '../view/markets_view.dart';

// ignore: must_be_immutable
class MarketCard extends StatelessWidget {
  final bool isUpdated;
  String cardTitleText, cardSubtitleText, dailyGainAsPrice;
  final double exDailyGain, newDailyGain;
  final ExchangeCurrency selectedCurrency;
  final VoidCallback onClicked;

  MarketCard({
    Key? key,
    required this.isUpdated,
    required this.dailyGainAsPrice,
    required this.cardSubtitleText,
    required this.cardTitleText,
    required this.exDailyGain,
    required this.newDailyGain,
    required this.selectedCurrency,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onClicked,
        title: Text(cardTitleText, style: getTitleStyle(context)),
        subtitle: Text(cardSubtitleText, style: getTitleStyle(context)),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [buildCurrencyIndicator(context)],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [buildDailyGain(context), buildDailyGainAsTL(context)],
        ),
        minLeadingWidth: 0,
      ),
    );
  }

  Icon buildCurrencyIndicator(BuildContext context) {
    return dailyGainAsPrice == "${selectedCurrency.icon}0.00"
        ? const Icon(Icons.trending_flat)
        : newDailyGain < 0.00
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
      "%${newDailyGain.toStringAsFixed(2)}",
      style: TextStyle(
        color: newDailyGain < 0.00 ? Colors.red : Colors.green,
      ),
    );
  }

  Text buildDailyGainAsTL(BuildContext context) {
    if (dailyGainAsPrice.contains("0,00")) {
      dailyGainAsPrice = dailyGainAsPrice.replaceAll("-", "");
    }
    return Text(
      dailyGainAsPrice,
      style: TextStyle(
        color: newDailyGain < 0.00 &&
                dailyGainAsPrice != "${selectedCurrency.icon}0,00"
            ? Colors.red
            : dailyGainAsPrice == "${selectedCurrency.icon}0,00"
                ? context.colors.onSurface
                : Colors.green,
      ),
    );
  }

  getTitleStyle(BuildContext context) {
    return isUpdated
        ? exDailyGain == newDailyGain
            ? const TextStyle()
            : TextStyle(
                color: exDailyGain < newDailyGain ? Colors.green : Colors.red,
              )
        : null;
  }
}
