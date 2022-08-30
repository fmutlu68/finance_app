import 'package:finance_app/core/components/list_view/auto_slider_list.dart';
import 'package:finance_app/production/notifiers/parity_provider.dart';
import 'package:finance_app/view/home/components/basket_item_slider_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasketItemsSlider extends StatefulWidget {
  const BasketItemsSlider({Key? key}) : super(key: key);

  @override
  State<BasketItemsSlider> createState() => _BasketItemsSliderState();
}

class _BasketItemsSliderState extends State<BasketItemsSlider> {
  @override
  Widget build(BuildContext context) {
    ParityProvider provider = context.watch<ParityProvider>();
    return provider.newParities.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : AutoSliderList(
            children: provider.parityInfos
                .map<Widget>((e) => BasketItemSliderCard(
                    infoModel: e,
                    moneyModel: provider.newParities
                        .firstWhere((element) => element.name == e.name)))
                .toList());
  }
}
