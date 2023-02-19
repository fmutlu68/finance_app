import 'package:finance_app/core/extensions/dynamic_size_extension.dart';
import 'package:finance_app/core/extensions/number_format_extension.dart';
import 'package:finance_app/core/extensions/padding_extension.dart';
import 'package:finance_app/core/extensions/theme_extension.dart';
import 'package:finance_app/production/features/finance_data/base/model/i_history_data.dart';
import 'package:finance_app/production/features/finance_data/base/model/i_money_response_model.dart';
import 'package:finance_app/production/features/finance_data/base/model/info_model.dart';
import 'package:finance_app/production/features/finance_data/models/req/currency_info.dart';
import 'package:finance_app/production/features/finance_data/models/req/history_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../../core/base/state/base_view_state.dart';
import '../../../../../../core/base/widget/base_view.dart';
import '../../../../../../production/constant/enum/currency_enum.dart';
import '../../../../../../production/constant/enum/graph_time_enum.dart';
import '../../../../../../production/models/data/history_data_info.dart';
import '../../../../../../production/notifiers/history_data_provider.dart';
import '../view_model/market_item_detail_view_model.dart';

part '../components/market_item_currency_info_container.dart';
part '../components/market_item_graphic.dart';

class MarketItemDetailView<T extends InfoModel, R extends IMoneyResponseModel,
    F extends IHistoryData<F>> extends StatefulWidget {
  final T info;
  final R exMarketItem;
  final R newMarketItem;
  final F parserModel;
  final ExchangeCurrency currencyType;
  final bool isUpdated;
  const MarketItemDetailView(
      {Key? key,
      required this.info,
      required this.currencyType,
      required this.exMarketItem,
      required this.newMarketItem,
      required this.isUpdated,
      required this.parserModel})
      : super(key: key);

  @override
  State<MarketItemDetailView<T, R, F>> createState() =>
      _MarketItemDetailViewState<T, R, F>();
}

class _MarketItemDetailViewState<T extends InfoModel,
        R extends IMoneyResponseModel, F extends IHistoryData<F>>
    extends BaseViewState<MarketItemDetailView<T, R, F>> {
  late MarketItemDetailViewModel viewModel;
  late TooltipBehavior _tooltipBehavior;
  late ZoomPanBehavior _zoomPanBehavior;

  @override
  Widget build(BuildContext context) {
    return BaseView<MarketItemDetailViewModel>(
      viewModel: MarketItemDetailViewModel(),
      onModelReady: (model) {
        viewModel = model;
        viewModel.setContext(context);
        viewModel.init();
        _zoomPanBehavior = ZoomPanBehavior(
          enablePinching: true,
          zoomMode: ZoomMode.x,
          enableDoubleTapZooming: true,
          enablePanning: true,
        );
        _tooltipBehavior = TooltipBehavior(enable: true);
        viewModel.initHistoryInfo(
            widget.info is CurrencyInfo
                ? HistoryInfo(name: "${widget.info.name}/TRL")
                : HistoryInfo(
                    name: widget.info.graphSymbol ??
                        widget.info.name.replaceAll("-", "/")),
            widget.parserModel);
      },
      onPageBuilder: (context, model) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: appBarCurrencyTitle,
              actions: [getMarketsIsOpenWidget],
            ),
            body: Column(
              children: [
                getMarketItemInfoContainer,
                buildGraphTimeList,
                getGraphicWidget,
              ],
            ),
          ),
        );
      },
      onDispose: () {},
    );
  }
}
