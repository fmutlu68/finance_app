import 'package:finance_app/production/features/finance_data/base/model/i_news.dart';

class HeadlineNews extends INews {
  final String? category;
  HeadlineNews(
      {required super.title,
      required super.link,
      required super.imageUrl,
      super.date,
      this.category});

  @override
  String toString() =>
      'HeadlineNews(title: $title, link: $link, imageUrl: $imageUrl)';
}
