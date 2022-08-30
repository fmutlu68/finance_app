import '../../base/model/i_category_news.dart';

class CurrencyNews extends ICategoryNews {
  CurrencyNews(
      {required super.title,
      required super.link,
      required super.imageUrl,
      super.date});
}
