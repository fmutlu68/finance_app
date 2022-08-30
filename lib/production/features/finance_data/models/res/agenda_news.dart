import 'package:finance_app/production/features/finance_data/base/model/i_category_news.dart';

class AgendaNews extends ICategoryNews {
  AgendaNews(
      {required super.title,
      required super.link,
      required super.imageUrl,
      super.date});
}
