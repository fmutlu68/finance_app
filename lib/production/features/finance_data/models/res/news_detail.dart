import 'package:finance_app/production/features/finance_data/base/model/i_news.dart';

class NewsDetail {
  final INews news;
  final String longTitle;
  final List<String> contentList;
  NewsDetail({
    required this.news,
    required this.longTitle,
    required this.contentList,
  });
}
