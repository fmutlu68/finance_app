part of '../view/market_item_detail_view.dart';

extension MarketItemCurrencyInfoContainer<
    T extends InfoModel,
    R extends IMoneyResponseModel,
    F extends IHistoryData<F>> on _MarketItemDetailViewState<T, R, F> {
  Widget get getCurrencyInfoContainer {
    return Container(
      width: double.infinity,
      color: context.colors.onError,
      child: Padding(
        padding: context.veryLowSymPadding,
        child: Column(
          children: [
            ListTile(
              title: Text("Günlük Değişim",
                  style: context.textTheme.subtitle1?.copyWith(
                    fontStyle: FontStyle.italic,
                  )),
              trailing: Text(
                "${widget.newMarketItem.dailyGainAsPrice} ${widget.currencyType.symbol}",
                style: getUpdateableStyle(
                  context,
                  widget.exMarketItem.dailyGain,
                  widget.newMarketItem.dailyGain,
                  style: context.textTheme.bodyText1?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              dense: true,
            ),
            ListTile(
              title: Text(
                  widget.newMarketItem.buyPrice == null
                      ? "Fiyat"
                      : "Alış/Satış",
                  style: context.textTheme.subtitle1?.copyWith(
                    fontStyle: FontStyle.italic,
                  )),
              trailing: Text(
                widget.newMarketItem.buyPrice == null
                    ? "${widget.newMarketItem.price}"
                    : "${widget.newMarketItem.buyPrice}/${widget.newMarketItem.sellPrice}",
                style: getUpdateableStyle(
                  context,
                  widget.exMarketItem.dailyGain,
                  widget.newMarketItem.dailyGain,
                  style: context.textTheme.bodyText1?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              dense: true,
            ),
            ListTile(
              title: Text("Gün İçi Aralık",
                  style: context.textTheme.subtitle1?.copyWith(
                    fontStyle: FontStyle.italic,
                  )),
              trailing: Text(
                  "${widget.newMarketItem.dailyLowestPrice}-${widget.newMarketItem.dailyTopPrice}",
                  style: getUpdateableStyle(
                    context,
                    widget.exMarketItem.dailyGain,
                    widget.newMarketItem.dailyGain,
                    style: context.textTheme.bodyText1?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              dense: true,
            ),
            ListTile(
              title: Text("Gün/Ay/Yıl Değişim",
                  style: context.textTheme.subtitle1
                      ?.copyWith(fontStyle: FontStyle.italic)),
              trailing: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text:
                            "%${widget.newMarketItem.dailyGain?.toStringAsFixed(2)}",
                        style: TextStyle(
                            color: (widget.newMarketItem.dailyGain ?? 0) > 0
                                ? Colors.green
                                : widget.newMarketItem.dailyGain == 0
                                    ? Colors.orangeAccent
                                    : Colors.red)),
                    const TextSpan(text: " / "),
                    TextSpan(
                        text: "%${widget.newMarketItem.monthlyGain}",
                        style: TextStyle(
                            color: (widget.newMarketItem.monthlyGain ?? 0) > 0
                                ? Colors.green
                                : widget.newMarketItem.monthlyGain == 0
                                    ? Colors.orangeAccent
                                    : Colors.red)),
                    const TextSpan(text: " / "),
                    TextSpan(
                        text: "%${widget.newMarketItem.yearlyGain}",
                        style: TextStyle(
                            color: (widget.newMarketItem.yearlyGain ?? 0) > 0
                                ? Colors.green
                                : widget.newMarketItem.yearlyGain == 0
                                    ? Colors.orangeAccent
                                    : Colors.red)),
                  ],
                ),
              ),
              dense: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget get appBarCurrencyTitle {
    return Text(
      "${widget.info.hideName ?? false ? "" : (widget.info.nameToShow ?? widget.info.name) + " - "}${widget.info.info}",
      style: getUpdateableStyle(
        context,
        widget.exMarketItem.dailyGain,
        widget.newMarketItem.dailyGain,
        style: context.textTheme.headline5?.copyWith(
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
        ),
      ),
      softWrap: true,
    );
  }

  Widget get appBarBottomMarketsState {
    return Text(
      widget.newMarketItem.marketsOpen ?? false
          ? "Piyasa açık"
          : "Veri gecikti",
      style: TextStyle(
          color: widget.newMarketItem.marketsOpen ?? false
              ? Colors.green
              : Colors.red),
    );
  }

  getUpdateableStyle(
    BuildContext context,
    double? exDailyGain,
    double? newDailyGain, {
    TextStyle? style,
  }) {
    return widget.isUpdated
        ? exDailyGain == newDailyGain
            ? style
            : style?.copyWith(
                  color:
                      exDailyGain! < newDailyGain! ? Colors.green : Colors.red,
                ) ??
                TextStyle(
                  color:
                      exDailyGain! < newDailyGain! ? Colors.green : Colors.red,
                )
        : style;
  }
}
