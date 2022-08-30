import 'package:finance_app/production/features/finance_data/base/i_data_service.dart';
import 'package:finance_app/production/features/finance_data/base/model/i_news.dart';
import 'package:finance_app/production/features/finance_data/models/res/bullonism_news.dart';
import 'package:finance_app/production/features/finance_data/models/res/crypto_news.dart';
import 'package:finance_app/production/features/finance_data/models/res/currency_news.dart';
import 'package:finance_app/production/features/finance_data/models/res/headline_news.dart';
import 'package:finance_app/production/features/finance_data/models/res/news_detail.dart';

import '../../models/res/agenda_news.dart';
import '../../models/res/commodity_news.dart';
import '../../models/res/stock_market_news.dart';

abstract class INewsDataService extends IDataService {
  INewsDataService({required super.manager});

  Future<List<HeadlineNews>> getHeadlines();
  Future<List<CurrencyNews>> getCurrencyNews();
  Future<List<CryptoNews>> getCryptoNews();
  Future<List<BullionismNews>> getBullionismNews();
  Future<List<StockMarketNews>> getStockMarketNews();
  Future<List<AgendaNews>> getAgendaNews();
  Future<List<CommodityNews>> getCommodityNews();
  Future<NewsDetail> getNewsDetail(INews news);
}
