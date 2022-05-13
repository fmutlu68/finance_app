// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'package:finance_app/core/base/state/base_view_state.dart';
// import 'package:finance_app/core/base/widget/base_view.dart';
// import 'package:finance_app/core/extensions/padding_extension.dart';
// import 'package:finance_app/core/extensions/theme_extension.dart';
// import 'package:finance_app/production/constant/enum/currency_enum.dart';
// import 'package:finance_app/production/features/finance_data/models/req/currency_info.dart';
// import 'package:finance_app/production/features/finance_data/models/res/currency.dart';
// import 'package:finance_app/production/notifiers/currency_provider.dart';
// import 'package:finance_app/view/home/markets/pages/currency_item_detail/view_model/currency_item_detail_view_model.dart';

// part '../components/market_item_currency_info_container.dart';
// // part '../components/market_item_graphic.dart';

// class CurrencyItemDetailView extends StatefulWidget {
//   final CurrencyInfo info;
//   final Currency currency;
//   final ExchangeCurrency currencyType;
//   const CurrencyItemDetailView({
//     Key? key,
//     required this.info,
//     required this.currency,
//     required this.currencyType,
//   }) : super(key: key);

//   @override
//   State<CurrencyItemDetailView> createState() => _CurrencyItemDetailViewState();
// }

// class _CurrencyItemDetailViewState
//     extends BaseViewState<CurrencyItemDetailView> {
//   late CurrencyItemDetailViewModel viewModel;
//   // late TooltipBehavior _tooltipBehavior;
//   // late ZoomPanBehavior _zoomPanBehavior;

//   @override
//   Widget build(BuildContext context) {
//     return BaseView<CurrencyItemDetailViewModel>(
//       viewModel: CurrencyItemDetailViewModel(),
//       onModelReady: (model) {
//         viewModel = model;
//         viewModel.setContext(context);
//         viewModel.init();
//         viewModel.initHistoryInfo("${widget.info.name}/TRL");
//         // _tooltipBehavior = TooltipBehavior(enable: true);
//         // _zoomPanBehavior = ZoomPanBehavior(
//         //   enablePinching: true,
//         //   zoomMode: ZoomMode.xy,
//         //   enablePanning: true,
//         //   enableDoubleTapZooming: true,
//         // );
//       },
//       onPageBuilder: (context, model) {
//         return SafeArea(
//           child: Scaffold(
//             appBar: AppBar(
//               title: appBarCurrencyTitle,
//               bottom: PreferredSize(
//                 child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: appBarBottomMarketsState),
//                 preferredSize: Size(double.infinity, calculateDynamicHeight(2)),
//               ),
//             ),
//             body: Column(
//               children: [
//                 getCurrencyInfoContainer,
//                 // buildGraphTimeList,
//                 // getGraphicWidget,
//               ],
//             ),
//           ),
//         );
//       },
//       onDispose: () {},
//     );
//   }
// }
