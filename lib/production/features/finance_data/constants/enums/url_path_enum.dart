enum UrlPath {
  currency,
  commodity,
  gold,
  parity,
  stockMarket,
  crypto,
  news,
  currencyNews,
  agendaNews,
  commodityNews,
  cryptoNews,
  bullionismNews,
  stockMarketNews,
  economicCalendar,
  currencyDailyHistory,
  currencyHistory,
  last2HoursHistory,
  dailyHistory,
  history,
}

extension UrlPathValueExtension on UrlPath {
  String get path {
    switch (this) {
      case UrlPath.currency:
        return "https://kur.doviz.com/serbest-piyasa/";
      case UrlPath.commodity:
        return "https://www.doviz.com/emtialar/";
      case UrlPath.gold:
        return "https://altin.doviz.com/";
      case UrlPath.parity:
        return "https://www.doviz.com/pariteler/";
      case UrlPath.stockMarket:
        return "https://borsa.doviz.com/endeksler";
      case UrlPath.crypto:
        return "https://www.doviz.com/kripto-paralar/";
      case UrlPath.news:
        return "https://haber.doviz.com/";
      case UrlPath.currencyNews:
        return "https://haber.doviz.com/doviz-haberleri/";
      case UrlPath.agendaNews:
        return "https://haber.doviz.com/gundem-haberleri/";
      case UrlPath.commodityNews:
        return "https://haber.doviz.com/emtia-haberleri/";
      case UrlPath.cryptoNews:
        return "https://haber.doviz.com/kripto-para-haberleri/";
      case UrlPath.bullionismNews:
        return "https://haber.doviz.com/altin-ve-degerli-metal-haberleri/";
      case UrlPath.stockMarketNews:
        return "https://haber.doviz.com/borsa-haberleri/";
      case UrlPath.economicCalendar:
        return "https://bigpara.hurriyet.com.tr/haberler/gunluk-piyasa-takvimi/";
      case UrlPath.currencyDailyHistory:
        return "https://www.foreks.com/api/historical/intraday?code=[CurCode]&period=5&last=288";
      case UrlPath.currencyHistory:
        return "https://www.foreks.com/api/historical/history?symbol=[CurCode]&resolution=1D&from=[StartDate]&to=[EndDate]";
      case UrlPath.dailyHistory:
        return "https://www.foreks.com/api/historical/intraday?code=[CurCode]&period=5&last=288";
      case UrlPath.last2HoursHistory:
        return "https://www.foreks.com/api/historical/intraday?code=[CurCode]&period=1&last=144";
      case UrlPath.history:
        return "https://www.foreks.com/api/historical/history?symbol=[CurCode]&resolution=1D&from=[StartDate]&to=[EndDate]";
    }
  }
}
