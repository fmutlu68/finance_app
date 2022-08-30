import 'package:finance_app/core/extensions/border_radius_extension.dart';
import 'package:finance_app/core/extensions/spacer_extension.dart';
import 'package:finance_app/core/extensions/theme_extension.dart';
import 'package:finance_app/production/features/finance_data/base/model/i_money_response_model.dart';
import 'package:finance_app/production/features/finance_data/base/model/info_model.dart';
import 'package:flutter/material.dart';

class BasketItemSliderCard<R extends InfoModel, T extends IMoneyResponseModel>
    extends StatelessWidget {
  final R infoModel;
  final T moneyModel;
  const BasketItemSliderCard(
      {Key? key, required this.infoModel, required this.moneyModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: context.colors.onBackground, width: .9),
            borderRadius: context.veryLowRadius,
          ),
          child: Row(
            children: [
              context.veryLowWidthSpacer,
              buildGain(context),
              context.veryLowWidthSpacer,
              buildTitle(context),
              context.veryLowWidthSpacer,
              buildPrice(context),
              context.veryLowWidthSpacer,
            ],
          )),
    );
  }

  buildGain(BuildContext context) {
    return Text(
      "%${moneyModel.dailyGain?.toStringAsFixed(2)}",
      style: context.textTheme.bodyMedium?.copyWith(
        color: (moneyModel.dailyGain ?? 0) < 0.00 ? Colors.red : Colors.green,
      ),
    );
  }

  buildPrice(BuildContext context) {
    return Text(
        moneyModel.price == null
            ? "${moneyModel.buyPrice!.toStringAsFixed(2)}/${moneyModel.sellPrice!.toStringAsFixed(2)}"
            : moneyModel.price!.toStringAsFixed(2),
        style: context.textTheme.bodyMedium);
  }

  buildTitle(BuildContext context) {
    return Text(
      "${infoModel.hideName ?? false ? "" : (infoModel.nameToShow?.replaceAll("-", "/") ?? infoModel.name.replaceAll("-", "/")) + " - "}${infoModel.info}",
      style: context.textTheme.bodyLarge,
    );
  }
}
