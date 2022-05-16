part of '../view/market_item_detail_view.dart';

extension MarketItemGraphicExtension<
    T extends InfoModel,
    R extends IMoneyResponseModel,
    F extends IHistoryData<F>> on _MarketItemDetailViewState<T, R, F> {
  Widget get getGraphicWidget {
    return Observer(
      builder: (_) {
        HistoryDataProvider dataProvider = context.watch<HistoryDataProvider>();
        return dataProvider.data[dataProvider.data.keys.firstWhere(
                    (element) => element == viewModel.historyInfo,
                    orElse: () => emptyDataInfo)] !=
                null
            ? Expanded(child: buildGraph(dataProvider))
            : const CircularProgressIndicator();
      },
    );
  }

  Widget get buildGraphTimeList => Observer(
      builder: (_) => SizedBox(
            width: double.infinity,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: GraphTime.values.map<Widget>(
                (e) {
                  bool isSelected = viewModel.historyInfo?.graphTime == e;
                  return ChoiceChip(
                    label: Text(e.text),
                    onSelected: (value) {
                      _zoomPanBehavior.reset();
                      viewModel.setDataInfo(e, widget.parserModel);
                    },
                    selected: isSelected,
                    backgroundColor: Colors.green,
                    selectedColor: Colors.blue,
                  );
                },
              ).toList(),
            ),
          ));

  SfCartesianChart buildGraph(HistoryDataProvider dataProvider) =>
      SfCartesianChart(
        trackballBehavior: TrackballBehavior(
            enable: true,
            tooltipSettings:
                const InteractiveTooltip(enable: true, color: Colors.green),
            tooltipDisplayMode: TrackballDisplayMode.floatAllPoints),
        tooltipBehavior: _tooltipBehavior,
        onTrackballPositionChanging: (_) => _tooltipBehavior.hide(),
        series: <ChartSeries<F, String>>[
          AreaSeries<F, String>(
            name: T is CurrencyInfo
                ? "${widget.info.name}/${widget.currencyType.symbol}"
                : (widget.info.name).replaceAll("-", "/"),
            dataSource: dataProvider.getGraphData<F>(viewModel.historyInfo!),
            xValueMapper: (F history, _) {
              if (viewModel.historyInfo?.graphTime != GraphTime.daily &&
                  viewModel.historyInfo?.graphTime != GraphTime.last2Hours) {
                return "${history.date?.year}\n${history.date?.month.getStringAsFormatted}.${history.date?.day.getStringAsFormatted}";
              }
              return "${history.date?.hour.getStringAsFormatted}.${history.date?.minute.getStringAsFormatted}";
            },
            yValueMapper: (F history, _) => history.close,
          )
        ],
        primaryYAxis: NumericAxis(
            numberFormat:
                NumberFormat.compactCurrency(symbol: widget.currencyType.icon),
            edgeLabelPlacement: EdgeLabelPlacement.shift),
        primaryXAxis: CategoryAxis(
          edgeLabelPlacement: EdgeLabelPlacement.shift,
        ),
        zoomPanBehavior: _zoomPanBehavior,
        selectionType: SelectionType.cluster,
      );
}
