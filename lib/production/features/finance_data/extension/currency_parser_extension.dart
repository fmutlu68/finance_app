import 'package:finance_app/production/features/finance_data/extension/time_extension.dart';
import 'package:finance_app/production/features/finance_data/models/req/currency_info.dart';
import 'package:finance_app/production/features/finance_data/services/currency_data_service.dart';
import 'package:flutter/material.dart';

extension CurrencyParserExtension on CurrencyDataService {
  String getBuyingCurrency(CurrencyInfo currency, String html) {
    RegExp currencyExp = RegExp(
        '<span data-socket-key="${currency.name}" data-socket-attr="bid">(.*?)</span>');
    return currencyExp.firstMatch(html)?.group(1) ?? "0.00";
  }

  String getSellingCurrency(CurrencyInfo currency, String html) {
    RegExp currencyExp = RegExp(
        '<span data-socket-key="${currency.name}" data-socket-attr="ask">(.*?)</span>');
    return currencyExp.firstMatch(html)?.group(1) ?? "0.00";
  }

  Map<String, String> getDailyLowestAndTopCurrency(
      CurrencyInfo currency, String html) {
    RegExp currencyExp = RegExp(
        '''<div class="mr-16"><div class="text-xs text-blue-gray-2">Günlük Aralık</div><div class="text-md font-semibold text-white mt-4">(.*?)</div></div>''');
    String match = currencyExp.firstMatch(html)!.group(1)!;
    List currencies = match.substring(0, match.indexOf("<")).split(" - ");
    return {"top": currencies[1], "lowest": currencies[0]};
  }

  String getDailyGain(CurrencyInfo currency, String html) {
    RegExp dailyExp = RegExp(
        '<span class="change (up|down)?" data-socket-key="${currency.name}"(.*?)data-socket-attr="c">(.*?)</span>');
    return dailyExp.firstMatch(html)?.group(3) ?? "0.00";
  }

  String getDailyGainAsTL(CurrencyInfo currency, String html) {
    RegExp dailyExp = RegExp(
        '(<span data-socket-key="${currency.name}"(.*?)data-socket-attr="a">(.*?)</span>)');
    return dailyExp.firstMatch(html)?.group(3) ?? "₺0.00";
  }

  Map<String, String> getHistoricalGains(CurrencyInfo currency, String html) {
    RegExp dailyExp = RegExp(
        '<div class="w-1/2"><div class="row"><span>(.*?)Haftalık Değişim(.*?)</span><span class="change(.*?)">(.*?)</span></div><div class="row"><span>(.*?)Aylık Değişim(.*?)</span><span class="change(.*?)">(.*?)</span></div><div class="row"><span>(.*?)Yıllık Değişim(.*?)</span><span class="change(.*?)">(.*?)</span></div></div>');
    RegExpMatch matchedExp = dailyExp.firstMatch(html)!;
    return {
      "weekly": matchedExp.group(4)!,
      "monthly": matchedExp.group(8)!,
      "yearly": matchedExp.group(12)!,
    };
  }

  String getLastUpdatedDate(CurrencyInfo currency, String html) {
    RegExp dailyExp =
        RegExp('<div class="text-xs text-blue-gray-2">(.*?)</div>');
    return (dailyExp.firstMatch(html)?.group(1) ?? "00:00")
        .replaceAll("Son (", "")
        .replaceAll(")", "");
  }

  bool getMarketsOpen(CurrencyInfo currency, String html) {
    String lastUpdatedDate = getLastUpdatedDate(currency, html);
    TimeOfDay time = TimeOfDay.now() -
        TimeOfDay(
            hour: int.parse(lastUpdatedDate.split(":")[0]),
            minute: int.parse(lastUpdatedDate.split(":")[1]));
    return time.hour == 0 && time.minute >= 0 && time.minute < 3;
  }
}
