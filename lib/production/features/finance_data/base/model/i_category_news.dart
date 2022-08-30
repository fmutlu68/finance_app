import 'package:finance_app/production/features/finance_data/base/model/i_news.dart';

abstract class ICategoryNews extends INews {
  ICategoryNews(
      {required super.title,
      required super.link,
      required super.imageUrl,
      super.date});
}
