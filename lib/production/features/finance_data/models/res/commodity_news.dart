import 'package:finance_app/production/features/finance_data/base/model/i_category_news.dart';

class CommodityNews extends ICategoryNews {
  CommodityNews(
      {required super.title,
      required super.link,
      required super.imageUrl,
      super.date});
}
