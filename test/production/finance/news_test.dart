import 'package:finance_app/core/start/network/service/network_manager.dart';
import 'package:finance_app/production/features/finance_data/base/service/i_news_data_service.dart';
import 'package:finance_app/production/features/finance_data/models/res/currency_news.dart';
import 'package:finance_app/production/features/finance_data/models/res/headline_news.dart';
import 'package:finance_app/production/features/finance_data/models/res/news_detail.dart';
import 'package:finance_app/production/features/finance_data/services/news_data_service.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  setUp(() {});
  test("News Api Test", () async {
    INewsDataService newsDataService =
        NewsDataService(manager: NetworkManager.instance);
    for (HeadlineNews news in await newsDataService.getHeadlines()) {
      print(news.toString());
    }
  });

  test("Currency News Api Test", () async {
    INewsDataService newsDataService =
        NewsDataService(manager: NetworkManager.instance);
    print((await newsDataService.getCurrencyNews()).length);
  });

  test("Detail News Api Test", () async {
    INewsDataService newsDataService =
        NewsDataService(manager: NetworkManager.instance);
    NewsDetail detail = await newsDataService.getNewsDetail(
      CurrencyNews(
        title: "",
        link:
            "https://haber.doviz.com/gundem-haberleri/fao-ukrayna-savasi-gida-fiyatlarinda-yuzde-20-lik-artisi-tetikleyebilir/646374",
        imageUrl: "",
      ),
    );
    print(detail.contentList.length);
  });
}
