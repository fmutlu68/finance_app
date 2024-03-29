import 'package:finance_app/production/features/finance_data/constants/enums/url_path_enum.dart';
import 'package:finance_app/production/features/finance_data/extension/time_extension.dart';
import 'package:finance_app/production/features/finance_data/models/req/commodity_info.dart';
import 'package:finance_app/production/features/finance_data/services/commodity_data_service.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

extension CommodityParserExtension on CommodityDataService {
  String getBuyingPrice(CommodityInfo commodity, String html) {
    // data-socket-type="${_getCommodityType(commodity)}"
    RegExp currencyExp = RegExp(
        '<div class="text-xl font-semibold text-white" data-socket-key="${commodity.name}"(.*?)data-socket-attr="s">(.*?)</div>');
    return currencyExp.firstMatch(html)?.group(2) ?? "0.00";
  }

  Map<String, String> getDailyLowestAndTopCommodity(
      CommodityInfo commodity, String html) {
    RegExp currencyExp = RegExp(
        '''<div class="mr-16"><div class="text-xs text-blue-gray-2">Günlük Aralık</div><div class="text-md font-semibold text-white mt-4">(.*?)</div></div>''');
    String match = currencyExp.firstMatch(html)!.group(1)!;
    List currencies = match.substring(0, match.indexOf("<")).split(" - ");
    return {"top": currencies[0], "lowest": currencies[1]};
  }

  String getDailyGain(CommodityInfo commodity, String html) {
    return parse(html)
        .getElementsByTagName("span")
        .firstWhere((element) =>
            element.attributes["data-socket-key"] == commodity.name &&
            element.attributes["data-socket-attr"] == "c")
        .text;
  }

  String getDailyGainAsPrice(CommodityInfo commodity, String html) {
    RegExp dailyExp = RegExp(
        '<span data-socket-key="${commodity.name}"(.*?)data-socket-attr="a">(.*?)</span>');
    return dailyExp.firstMatch(html)?.group(2) ?? "\$0.00";
  }

  bool getMarketsOpen(CommodityInfo commodity, String html) {
    RegExp dailyExp =
        RegExp('<div class="text-xs text-blue-gray-2">(.*?)</div>');
    String lastDataTime = (dailyExp.firstMatch(html)?.group(1) ?? "00:00")
        .replaceAll("Son (", "")
        .replaceAll(")", "");
    TimeOfDay time = TimeOfDay.now() -
        TimeOfDay(
            hour: int.parse(lastDataTime.split(":")[0]),
            minute: int.parse(lastDataTime.split(":")[1]));
    return time.hour == 0 && time.minute < 3;
  }

  Map<String, String> getHistoricalGains(CommodityInfo commodity, String html) {
    RegExp historicalData = RegExp(
        '<div class="w-1/2"><div class="row"><span>(.*?)Haftalık Değişim(.*?)</span><span class="change(.*?)">(.*?)</span></div><div class="row"><span>(.*?)Aylık Değişim(.*?)</span><span class="change(.*?)">(.*?)</span></div><div class="row"><span>(.*?)Yıllık Değişim(.*?)</span><span class="change(.*?)">(.*?)</span></div></div>');
    ;
    RegExpMatch? matchedExp = historicalData.firstMatch(html);
    return {
      "weekly": matchedExp?.group(2) ?? "0.00",
      "monthly": matchedExp?.group(4) ?? "0.00",
      "yearly": matchedExp?.group(6) ?? "0.00",
    };
  }

  String getMainPath(CommodityInfo info) {
    switch (info.path) {
      case "gumus":
      case "gram-altin":
      case "ceyrek-altin":
        return UrlPath.gold.path;
      default:
        return UrlPath.commodity.path;
    }
  }

  bool isCommodityByTL(CommodityInfo info) {
    return info.path == "gram-altin" ||
        info.path == "gumus" ||
        info.path == "ceyrek-altin";
  }

  String _getCommodityType(CommodityInfo info) =>
      isCommodityByTL(info) ? "G" : "E";
}
