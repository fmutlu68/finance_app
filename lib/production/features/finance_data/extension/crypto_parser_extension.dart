import 'package:finance_app/production/features/finance_data/extension/time_extension.dart';
import 'package:finance_app/production/features/finance_data/models/req/crypto_info.dart';
import 'package:finance_app/production/features/finance_data/services/crypto_data_service.dart';
import 'package:flutter/material.dart';

extension CryptoParserExtension on CryptoDataService {
  String getPrice(CryptoInfo crypto, String html) {
    RegExp crptoExp = RegExp(
        '<div class="text-xl font-semibold text-white" data-socket-key="${crypto.name}" data-socket-type="D" data-socket-attr="s">(.*?)</div>');
    return crptoExp.firstMatch(html)?.group(1) ?? "0.00";
  }

  String getDailyGain(CryptoInfo crypto, String html) {
    RegExp dailyExp = RegExp(
        '<div data-socket-key="${crypto.name}" data-socket-type="D" data-socket-attr="c">(.*?)</div>');
    return dailyExp.firstMatch(html)?.group(1) ?? "0.00";
  }

  String getDailyGainAsPrice(CryptoInfo crypto, String html) {
    RegExp dailyExp = RegExp(
        '(<span data-socket-key="${crypto.name}" data-socket-type="D" data-socket-attr="a">(.*?)</span>)');
    return dailyExp.firstMatch(html)?.group(2)?.replaceAll(" ", "") ?? "\$0.00";
  }

  Map<String, String> getDailyLowestAndTopCrypto(
      CryptoInfo crypto, String html) {
    RegExp exp = RegExp(
        '''<div><div class="text-xs text-blue-gray-2">Günlük Aralık</div><div class="text-md font-semibold text-white mt-4">(.*?)</div></div>''');
    String match = exp.firstMatch(html)!.group(1)!;
    List currencies = match.substring(0, match.indexOf("<")).split(" - ");
    return {"top": currencies[1], "lowest": currencies[0]};
  }

  bool getMarketsOpen(CryptoInfo crypto, String html) {
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

  Map<String, String> getHistoricalGains(CryptoInfo crypto, String html) {
    RegExp dailyExp = RegExp(
        '<td class="text-bold color-(.*?)">(.*?)</td><td class="text-bold color-(.*?)">(.*?)</td><td class="text-bold color-(.*?)">(.*?)</td>');
    RegExpMatch matchedExp = dailyExp.firstMatch(html)!;
    return {
      "weekly": matchedExp.group(2)!,
      "monthly": matchedExp.group(4)!,
      "yearly": matchedExp.group(6)!,
    };
  }
}
