import 'package:finance_app/production/features/finance_data/base/model/i_category_news.dart';

class StockMarketNews extends ICategoryNews {
  StockMarketNews(
      {required super.title,
      required super.link,
      required super.imageUrl,
      super.date});
}
