import 'package:finance_app/production/features/finance_data/base/model/i_news.dart';
import 'package:finance_app/production/features/finance_data/base/service/i_news_data_service.dart';
import 'package:finance_app/production/features/finance_data/constants/enums/url_path_enum.dart';
import 'package:finance_app/production/features/finance_data/extension/html_parser_extension.dart';
import 'package:finance_app/production/features/finance_data/extension/news_parser_extension.dart';
import 'package:finance_app/production/features/finance_data/models/res/agenda_news.dart';
import 'package:finance_app/production/features/finance_data/models/res/bullonism_news.dart';
import 'package:finance_app/production/features/finance_data/models/res/commodity_news.dart';
import 'package:finance_app/production/features/finance_data/models/res/crypto_news.dart';
import 'package:finance_app/production/features/finance_data/models/res/currency_news.dart';
import 'package:finance_app/production/features/finance_data/models/res/headline_news.dart';
import 'package:finance_app/production/features/finance_data/models/res/news_detail.dart';
import 'package:finance_app/production/features/finance_data/models/res/stock_market_news.dart';

class NewsDataService extends INewsDataService {
  NewsDataService({required super.manager});

  @override
  Future<List<HeadlineNews>> getHeadlines() async {
    String parsedHtml = parseHtml(
        (await manager.coreDio.getPage(path: UrlPath.news.path)).data ?? "");
    HeadlineNews? firstHeadline;
    try {
      firstHeadline = getFirstHeadline(parsedHtml);
    } catch (e) {
      print("Headline Error");
    }
    return [
      if (firstHeadline?.title != "") firstHeadline!,
      ...getOtherHeadlines(parsedHtml)
    ];
  }

  @override
  Future<List<CurrencyNews>> getCurrencyNews() async {
    String parsedHtml = parseHtml(
        (await manager.coreDio.getPage(path: UrlPath.currencyNews.path)).data ??
            "");
    return [
      ...getCategoryNewsList<CurrencyNews>(
        parsedHtml,
        (title, link, imageUrl, date) => CurrencyNews(
            title: title, link: link, imageUrl: imageUrl, date: date),
      )
    ];
  }

  @override
  Future<List<AgendaNews>> getAgendaNews() async {
    String parsedHtml = parseHtml(
        (await manager.coreDio.getPage(path: UrlPath.agendaNews.path)).data ??
            "");
    return [
      ...getCategoryNewsList<AgendaNews>(
        parsedHtml,
        (title, link, imageUrl, date) => AgendaNews(
            title: title, link: link, imageUrl: imageUrl, date: date),
      )
    ];
  }

  @override
  Future<NewsDetail> getNewsDetail(INews news) async {
    String parsedHtml =
        parseHtml((await manager.coreDio.getPage(path: news.link)).data ?? "");
    return getNewsContent(parsedHtml, news);
  }

  @override
  Future<List<CryptoNews>> getCryptoNews() async {
    String parsedHtml = parseHtml(
        (await manager.coreDio.getPage(path: UrlPath.cryptoNews.path)).data ??
            "");
    return [
      ...getCategoryNewsList<CryptoNews>(
        parsedHtml,
        (title, link, imageUrl, date) => CryptoNews(
            title: title, link: link, imageUrl: imageUrl, date: date),
      )
    ];
  }

  @override
  Future<List<BullionismNews>> getBullionismNews() async {
    String parsedHtml = parseHtml(
        (await manager.coreDio.getPage(path: UrlPath.bullionismNews.path))
                .data ??
            "");
    return [
      ...getCategoryNewsList<BullionismNews>(
        parsedHtml,
        (title, link, imageUrl, date) => BullionismNews(
            title: title, link: link, imageUrl: imageUrl, date: date),
      )
    ];
  }

  @override
  Future<List<StockMarketNews>> getStockMarketNews() async {
    String parsedHtml = parseHtml(
        (await manager.coreDio.getPage(path: UrlPath.stockMarketNews.path))
                .data ??
            "");
    return [
      ...getCategoryNewsList<StockMarketNews>(
        parsedHtml,
        (title, link, imageUrl, date) => StockMarketNews(
            title: title, link: link, imageUrl: imageUrl, date: date),
      )
    ];
  }

  @override
  Future<List<CommodityNews>> getCommodityNews() async {
    String parsedHtml = parseHtml(
        (await manager.coreDio.getPage(path: UrlPath.commodityNews.path))
                .data ??
            "");
    return [
      ...getCategoryNewsList<CommodityNews>(
        parsedHtml,
        (title, link, imageUrl, date) => CommodityNews(
            title: title, link: link, imageUrl: imageUrl, date: date),
      )
    ];
  }
}
