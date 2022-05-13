import 'dart:async';

import 'package:finance_app/core/start/network/service/network_manager.dart';
import 'package:finance_app/production/features/finance_data/base/model/i_news.dart';
import 'package:finance_app/production/features/finance_data/base/service/i_news_data_service.dart';
import 'package:finance_app/production/features/finance_data/models/res/agenda_news.dart';
import 'package:finance_app/production/features/finance_data/models/res/bullonism_news.dart';
import 'package:finance_app/production/features/finance_data/models/res/crypto_news.dart';
import 'package:finance_app/production/features/finance_data/models/res/currency_news.dart';
import 'package:finance_app/production/features/finance_data/models/res/headline_news.dart';
import 'package:finance_app/production/features/finance_data/models/res/news_detail.dart';
import 'package:finance_app/production/features/finance_data/models/res/stock_market_news.dart';
import 'package:finance_app/production/features/finance_data/services/news_data_service.dart';
import 'package:flutter/material.dart';

class NewsProvider extends ChangeNotifier {
  late final INewsDataService _newsDataService;
  List<HeadlineNews> headlines = [];
  List<CurrencyNews> currencyNews = [];
  List<AgendaNews> agendaNews = [];
  List<CryptoNews> cryptoNews = [];
  List<BullonismNews> bullonismNews = [];
  List<StockMarketNews> stockMarketNews = [];
  final List<NewsDetail> _details = [];

  bool _isStarted = false;
  bool isUpdated = false;

  NewsProvider() {
    _newsDataService = NewsDataService(manager: NetworkManager.instance);
    if (!_isStarted) {
      _isStarted = true;
      startLoadData();
    }
  }

  Future<void> startLoadData() async {
    await loadData();
    Timer.periodic(const Duration(minutes: 4), (timer) async {
      await loadData();
    });
  }

  Future<void> loadData() async {
    // try {

    // } catch (error) {
    //   debugPrint("Catched an Error: $error");
    //   print(error.runtimeType);
    // }
    headlines = await _newsDataService.getHeadlines();
    currencyNews = await _newsDataService.getCurrencyNews();
    agendaNews = await _newsDataService.getAgendaNews();
    cryptoNews = await _newsDataService.getCryptoNews();
    bullonismNews = await _newsDataService.getBullonismNews();
    stockMarketNews = await _newsDataService.getStockMarketNews();
    isUpdated = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1), () {
      isUpdated = false;
      notifyListeners();
    });
  }

  Future<NewsDetail?> getNewsDetail<T extends INews>(T news) async {
    try {
      if (_details.any((e) => selectDetail(e, news))) {
        return _details.firstWhere((e) => selectDetail(e, news));
      } else {
        NewsDetail detailToSave = await _newsDataService.getNewsDetail(news);
        _details.add(detailToSave);
        return detailToSave;
      }
    } catch (e) {
      print("Catched Error Detail: $e");
      return null;
    }
  }

  bool selectDetail(NewsDetail element, INews news) {
    return element.news.title.toLowerCase() == news.title.toLowerCase();
  }
}
