part of '../view/markets_view.dart';

class CurrencyCard extends StatelessWidget {
  final Currency exCurrency;
  final Currency newCurrency;
  final CurrencyInfo currencyInfo;
  final bool isUpdated;
  const CurrencyCard({
    Key? key,
    required this.exCurrency,
    required this.newCurrency,
    required this.currencyInfo,
    required this.isUpdated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          context.navigate(NavigationRoute.navigateToCurrencyItemDetail(
              currencyInfo, newCurrency));
        },
        title: Text(
          "${currencyInfo.name} - ${currencyInfo.info}",
          style: getTitleStyle(context),
        ),
        subtitle: Text("${newCurrency.buyPrice} / ${newCurrency.sellPrice}"),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildCurrencyIndicator(context),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildDailyGain(context),
            buildDailyGainAsTL(context),
          ],
        ),
        minLeadingWidth: 0,
      ),
    );
  }

  Icon buildCurrencyIndicator(BuildContext context) {
    return newCurrency.dailyGainAsPrice! == "₺0,00"
        ? const Icon(Icons.trending_flat)
        : (newCurrency.dailyGain ?? 0.00) < 0.00
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
      "%${newCurrency.dailyGain!.toStringAsFixed(2)}",
      style: TextStyle(
        color:
            (newCurrency.dailyGain ?? 0.00) < 0.00 ? Colors.red : Colors.green,
      ),
    );
  }

  Text buildDailyGainAsTL(BuildContext context) {
    if (newCurrency.dailyGainAsPrice!.contains("0,00")) {
      newCurrency.dailyGainAsPrice =
          newCurrency.dailyGainAsPrice!.replaceAll("-", "");
    }
    return Text(
      newCurrency.dailyGainAsPrice!,
      style: TextStyle(
        color: newCurrency.dailyGain! < 0.00 &&
                newCurrency.dailyGainAsPrice! != "₺0,00"
            ? Colors.red
            : newCurrency.dailyGainAsPrice! == "₺0,00"
                ? context.colors.onSurface
                : Colors.green,
      ),
    );
  }

  getTitleStyle(BuildContext context) {
    return isUpdated
        ? exCurrency.dailyGain! == newCurrency.dailyGain!
            ? const TextStyle()
            : TextStyle(
                color: exCurrency.dailyGain! < newCurrency.dailyGain!
                    ? Colors.green
                    : Colors.red,
              )
        : null;
  }
}
