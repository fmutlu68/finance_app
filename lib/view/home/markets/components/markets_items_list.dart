part of '../view/markets_view.dart';

class MarketsItemsList<T extends InfoModel, R extends ResponseModel>
    extends StatelessWidget {
  final List<T> marketItemsInfos;
  final List<R> exMarketItems;
  final List<R> newMarketItems;
  final bool isUpdated;
  final Widget Function(T info, R exItem, R newItem, bool isUpdated) buildCard;

  const MarketsItemsList({
    Key? key,
    required this.marketItemsInfos,
    required this.exMarketItems,
    required this.newMarketItems,
    required this.isUpdated,
    required this.buildCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: marketItemsInfos.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        R exItem = exMarketItems[index];
        R newItem = newMarketItems[index];
        T itemInfo = marketItemsInfos[index];
        return index == 0
            ? Padding(
                padding: const EdgeInsets.only(top: 5),
                child: buildCard(itemInfo, exItem, newItem, isUpdated),
              )
            : buildCard(itemInfo, exItem, newItem, isUpdated);
      },
    );
  }
}
