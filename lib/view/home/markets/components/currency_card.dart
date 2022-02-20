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
        onTap: () {},
        title: Text(
          "${currencyInfo.name} - ${currencyInfo.info}",
          style: getTitleStyle(context),
        ),
        subtitle:
            Text("${newCurrency.buyCurrency} / ${newCurrency.sellCurrency}"),
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
    return newCurrency.dailyGainAsTL! == "₺0,00"
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
    if (newCurrency.dailyGainAsTL!.contains("0,00")) {
      newCurrency.dailyGainAsTL =
          newCurrency.dailyGainAsTL!.replaceAll("-", "");
    }
    return Text(
      newCurrency.dailyGainAsTL!,
      style: TextStyle(
        color: newCurrency.dailyGain! < 0.00 &&
                newCurrency.dailyGainAsTL! != "₺0,00"
            ? Colors.red
            : newCurrency.dailyGainAsTL! == "₺0,00"
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
