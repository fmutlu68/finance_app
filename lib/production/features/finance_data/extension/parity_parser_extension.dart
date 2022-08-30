part of '../services/parity_data_service.dart';

extension ParityParserExtension on ParityDataService {
  String getPrice(ParityInfo parity, String html) {
    RegExp currencyExp = RegExp(
        '<div class="text-xl font-semibold text-white" data-socket-key="${parity.name}" data-socket-type="P" data-socket-attr="s">(.*?)</div>');
    return currencyExp.firstMatch(html)?.group(1) ?? "0.00";
  }

  String getDailyGain(ParityInfo parity, String html) {
    RegExp dailyExp = RegExp(
        '<div data-socket-key="${parity.name}" data-socket-type="P" data-socket-attr="c">(.*?)</div>');
    return dailyExp.firstMatch(html)?.group(1) ?? "0.00";
  }

  String getDailyGainAsPrice(ParityInfo parity, String html) {
    RegExp dailyExp = RegExp(
        '(<span data-socket-key="${parity.name}" data-socket-type="P" data-socket-attr="a">(.*?)</span>)');
    return dailyExp.firstMatch(html)?.group(2) ?? "0.00";
  }

  Map<String, String> getDailyLowestAndTopParity(
      ParityInfo parity, String html) {
    RegExp currencyExp = RegExp(
        '''<div class="mr-16"><div class="text-xs text-blue-gray-2">Günlük Aralık</div><div class="text-md font-semibold text-white mt-4">(.*?)</div></div>''');
    String match = currencyExp.firstMatch(html)!.group(1)!;
    List currencies = match.substring(0, match.indexOf("<")).split(" - ");
    return {"top": currencies[1], "lowest": currencies[0]};
  }

  Map<String, String> getHistoricalGains(ParityInfo parity, String html) {
    RegExp dailyExp = RegExp(
        '<td class="text-bold color-(.*?)">(.*?)</td><td class="text-bold color-(.*?)">(.*?)</td><td class="text-bold color-(.*?)">(.*?)</td>');
    RegExpMatch matchedExp = dailyExp.firstMatch(html)!;
    return {
      "weekly": matchedExp.group(2)!,
      "monthly": matchedExp.group(4)!,
      "yearly": matchedExp.group(6)!,
    };
  }

  bool getMarketsOpen(ParityInfo parity, String html) {
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
}
