// part of '../view/market_item_detail_view.dart';

// extension MarketItemCurrencyInfoContainer on _CurrencyItemDetailViewState {
//   Widget get getCurrencyInfoContainer {
//     Currency newCurrency = context
//         .watch<CurrencyProvider>()
//         .newCurrencies
//         .firstWhere((c) => c.name == widget.currency.name);
//     Currency exCurrency = context
//         .watch<CurrencyProvider>()
//         .exCurrencies
//         .firstWhere((c) => c.name == widget.currency.name);
//     return Container(
//       width: double.infinity,
//       color: context.colors.onError,
//       child: Padding(
//         padding: context.veryLowSymPadding,
//         child: Column(
//           children: [
//             ListTile(
//               title: Text("Günlük Değişim",
//                   style: context.textTheme.subtitle1?.copyWith(
//                     fontStyle: FontStyle.italic,
//                   )),
//               trailing: Text(
//                 "${newCurrency.dailyGainAsPrice} TL",
//                 style: getUpdateableStyle(
//                   context,
//                   exCurrency.dailyGain,
//                   newCurrency.dailyGain,
//                   style: context.textTheme.bodyText1?.copyWith(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               dense: true,
//             ),
//             ListTile(
//               title: Text("Alış/Satış",
//                   style: context.textTheme.subtitle1?.copyWith(
//                     fontStyle: FontStyle.italic,
//                   )),
//               trailing: Text(
//                 "${newCurrency.buyPrice}/${newCurrency.sellPrice}",
//                 style: getUpdateableStyle(
//                   context,
//                   exCurrency.dailyGain,
//                   newCurrency.dailyGain,
//                   style: context.textTheme.bodyText1?.copyWith(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               dense: true,
//             ),
//             ListTile(
//               title: Text("Gün İçi Aralık",
//                   style: context.textTheme.subtitle1?.copyWith(
//                     fontStyle: FontStyle.italic,
//                   )),
//               trailing: Text(
//                   "${newCurrency.dailyLowestPrice}-${newCurrency.dailyTopPrice}",
//                   style: getUpdateableStyle(
//                     context,
//                     exCurrency.dailyGain,
//                     newCurrency.dailyGain,
//                     style: context.textTheme.bodyText1?.copyWith(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   )),
//               dense: true,
//             ),
//             ListTile(
//               title: Text("Gün/Ay/Yıl Değişim",
//                   style: context.textTheme.subtitle1
//                       ?.copyWith(fontStyle: FontStyle.italic)),
//               trailing: Text.rich(
//                 TextSpan(
//                   children: [
//                     TextSpan(
//                         text: "%${newCurrency.dailyGain?.toStringAsFixed(2)}",
//                         style: TextStyle(
//                             color: (newCurrency.dailyGain ?? 0) > 0
//                                 ? Colors.green
//                                 : newCurrency.dailyGain == 0
//                                     ? Colors.orangeAccent
//                                     : Colors.red)),
//                     const TextSpan(text: " / "),
//                     TextSpan(
//                         text: "%${newCurrency.monthlyGain}",
//                         style: TextStyle(
//                             color: (newCurrency.monthlyGain ?? 0) > 0
//                                 ? Colors.green
//                                 : newCurrency.monthlyGain == 0
//                                     ? Colors.orangeAccent
//                                     : Colors.red)),
//                     const TextSpan(text: " / "),
//                     TextSpan(
//                         text: "%${newCurrency.yearlyGain}",
//                         style: TextStyle(
//                             color: (newCurrency.yearlyGain ?? 0) > 0
//                                 ? Colors.green
//                                 : newCurrency.yearlyGain == 0
//                                     ? Colors.orangeAccent
//                                     : Colors.red)),
//                   ],
//                 ),
//               ),
//               dense: true,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget get appBarCurrencyTitle {
//     Currency newCurrency = context
//         .watch<CurrencyProvider>()
//         .newCurrencies
//         .firstWhere((c) => c.name == widget.currency.name);
//     Currency exCurrency = context
//         .watch<CurrencyProvider>()
//         .exCurrencies
//         .firstWhere((c) => c.name == widget.currency.name);
//     return Text(
//       "${widget.info.name} - ${widget.info.info}",
//       style: getUpdateableStyle(
//         context,
//         exCurrency.dailyGain,
//         newCurrency.dailyGain,
//         style: context.textTheme.headline5?.copyWith(
//           fontStyle: FontStyle.italic,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       softWrap: true,
//     );
//   }

//   Widget get appBarBottomMarketsState {
//     Currency newCurrency = context
//         .watch<CurrencyProvider>()
//         .newCurrencies
//         .firstWhere((c) => c.name == widget.currency.name);
//     return Text(
//       newCurrency.marketsOpen ?? false ? "Piyasa açık" : "Piyasa kapalı",
//       style: TextStyle(
//           color: newCurrency.marketsOpen ?? false ? Colors.green : Colors.red),
//     );
//   }

//   getUpdateableStyle(
//     BuildContext context,
//     double? exDailyGain,
//     double? newDailyGain, {
//     TextStyle? style,
//   }) {
//     return context.watch<CurrencyProvider>().isUpdated
//         ? exDailyGain == newDailyGain
//             ? style
//             : style?.copyWith(
//                   color:
//                       exDailyGain! < newDailyGain! ? Colors.green : Colors.red,
//                 ) ??
//                 TextStyle(
//                   color:
//                       exDailyGain! < newDailyGain! ? Colors.green : Colors.red,
//                 )
//         : style;
//   }
// }
