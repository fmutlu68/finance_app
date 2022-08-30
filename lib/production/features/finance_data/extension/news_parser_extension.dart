import 'package:finance_app/production/features/finance_data/base/model/i_category_news.dart';
import 'package:finance_app/production/features/finance_data/base/model/i_news.dart';
import 'package:finance_app/production/features/finance_data/models/res/headline_news.dart';
import 'package:finance_app/production/features/finance_data/models/res/news_detail.dart';
import 'package:finance_app/production/features/finance_data/services/news_data_service.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart' show parse;

extension NewsParserExtension on NewsDataService {
  HeadlineNews getFirstHeadline(String html) {
    Element firstHeadlineElement = parse(html)
        .body!
        .getElementsByClassName("featured-news-first")
        .first
        .children
        .first;
    Element headlineImageElement =
        firstHeadlineElement.getElementsByTagName("img").first;
    return HeadlineNews(
      title: firstHeadlineElement.getElementsByClassName("title").first.text,
      imageUrl: headlineImageElement.attributes["src"]?.getPath(true) ?? "",
      link: firstHeadlineElement.attributes["href"] ?? "",
      category: firstHeadlineElement
          .getElementsByClassName("category")
          .first
          .innerHtml,
      date: firstHeadlineElement.getElementsByClassName("date").first.innerHtml,
    );
  }

  List<HeadlineNews> getOtherHeadlines(String html) {
    // RegExp otherNewsExp = RegExp(
    //     '<a href="(.*?)" class="news-item" title="(.*?)"><div class="thumbnail"><img src="(.*?)" alt="(.*?)"></div><span class="category">(.*?)</span><span class="title">(.*?)</span><span class="date">(.*?)</span></a>');
    // return otherNewsExp
    //     .allMatches(html)
    //     .map<HeadlineNews>((e) => HeadlineNews(
    //         title: e.group(2)!,
    //         link: e.group(1)!,
    //         imageUrl: e.group(3)!.getPath(false),
    //         category: e.group(5)!,
    //         date: e.group(7)!))
    //     .toList();
    List<Element> otherHeadlines = parse(html)
        .getElementsByTagName("a")
        .where((element) => element.className.contains("news-item"))
        .toList();
    return otherHeadlines
        .map<HeadlineNews>((e) => HeadlineNews(
              imageUrl: e
                      .getElementsByTagName("img")[0]
                      .attributes["src"]
                      ?.getPath(false) ??
                  "",
              link: e.attributes["href"] ?? "",
              title: e.getElementsByClassName("title")[0].text.trim(),
              category: e.getElementsByClassName("category")[0].text.trim(),
              date: e.getElementsByClassName("date")[0].text.trim(),
            ))
        .toList();
  }

  List<T> getCategoryNewsList<T extends ICategoryNews>(
    String html,
    T Function(String, String, String, String?) setNews,
  ) {
    List<T> newsList = [];
    Element mainElement =
        parse(html).getElementsByClassName("article-content")[0];
    for (Element listItemElement
        in mainElement.getElementsByClassName("list-item")) {
      newsList.add(setNews(
          listItemElement
              .getElementsByTagName("a")
              .firstWhere((element) => element.className.contains("title"))
              .text,
          listItemElement.getElementsByTagName("a")[0].attributes["href"] ?? "",
          listItemElement.getElementsByTagName("img")[0].attributes["src"]!,
          listItemElement.getElementsByClassName("date")[0].text.trim()));
    }
    return newsList;
  }

  NewsDetail getNewsContent(String html, INews news) {
    Element baseElement = parse(html).getElementsByClassName("content").first;
    Element longTitleElement = baseElement.getElementsByTagName("h2").first;
    List<Element> contents = baseElement.getElementsByTagName("p");
    return NewsDetail(
      news: news,
      longTitle: longTitleElement.text,
      contentList: contents.map<String>((e) => e.text).toList(),
    );
  }
}

extension ImageSizeExtension on String {
  String getPath(bool isFirst) {
    String s = replaceAll("_269x80", "");
    return isFirst ? s : s.replaceAll("thumbs/", "");
  }
}
