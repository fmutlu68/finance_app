// part of '../view/market_item_detail_view.dart';

// extension MarketItemGraphicExtension on _CurrencyItemDetailViewState {
//   Widget get getGraphicWidget => Observer(
//         builder: (context) {
//           HistoryDataProvider dataProvider =
//               context.watch<HistoryDataProvider>();
//           dataProvider.loadGraphData<CurrencyHistory>(viewModel.historyInfo!);
//           return dataProvider.data[dataProvider.data.keys.firstWhere(
//                     (element) =>
//                         element.symbol == viewModel.historyInfo?.symbol &&
//                         element.graphTime == viewModel.historyInfo?.graphTime,
//                     orElse: () => HistoryDataInfo.empty(),
//                   )] !=
//                   null
//               ? Expanded(
//                   child: buildGraph(dataProvider),
//                 )
//               : const CircularProgressIndicator();
//         },
//       );

//   Widget get buildGraphTimeList => Observer(
//       builder: (_) => SizedBox(
//             width: double.infinity,
//             height: 60,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: GraphTime.values.map<Widget>(
//                 (e) {
//                   bool isSelected = viewModel.historyInfo?.graphTime == e;
//                   return ChoiceChip(
//                     label: Text(e.text),
//                     onSelected: (value) {
//                       if (viewModel.historyInfo?.graphTime == e) {
//                         _zoomPanBehavior.reset();
//                         return;
//                       }
//                       viewModel.setDataInfo(HistoryDataInfo(
//                           symbol: viewModel.historyInfo!.symbol, graphTime: e));
//                     },
//                     selected: isSelected,
//                     backgroundColor: Colors.green,
//                     selectedColor: Colors.blue,
//                   );
//                 },
//               ).toList(),
//             ),
//           ));

//   SfCartesianChart buildGraph(HistoryDataProvider dataProvider) =>
//       SfCartesianChart(
//         tooltipBehavior: _tooltipBehavior,
//         series: <ChartSeries<CurrencyHistory, String>>[
//           LineSeries<CurrencyHistory, String>(
//             name: "${widget.info.name}/TRY",
//             dataSource: dataProvider
//                 .getGraphData<CurrencyHistory>(viewModel.historyInfo!),
//             xValueMapper: (CurrencyHistory history, _) {
//               if (viewModel.historyInfo?.graphTime != GraphTime.daily) {
//                 return "${history.date?.year}\n${history.date?.month.getStringAsFormatted}.${history.date?.day.getStringAsFormatted}";
//               }
//               return "${history.date?.hour.getStringAsFormatted}.${history.date?.minute.getStringAsFormatted}";
//             },
//             yValueMapper: (CurrencyHistory history, _) => history.close,
//             enableTooltip: true,
//           )
//         ],
//         primaryYAxis: NumericAxis(
//           numberFormat: NumberFormat.compactCurrency(symbol: "₺"),
//           edgeLabelPlacement: EdgeLabelPlacement.shift,
//         ),
//         primaryXAxis:
//             CategoryAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
//         zoomPanBehavior: _zoomPanBehavior,
//       );
// }
