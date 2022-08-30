// ignore_for_file: unnecessary_string_escapes

import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

main() {
  setUp(() {});

  test(
    "Bloomberg HT Test",
    () async {
      final channel =
          WebSocketChannel.connect(Uri.parse("wss://nc.ciner.com.tr/sub/dot"));
      channel.stream.listen((event) {
        print(event);
      });

      await Future.delayed(const Duration(seconds: 20));
    },
  );

  test(
    "Investing.com Test",
    () async {
      // final response = await Dio()
      //     .get("https://stream34.forexpros.com/echo/info?t=1655838731983");
      // print(response.data.toString());
      final channel = WebSocketChannel.connect(Uri.parse(
          "wss://stream34.forexpros.com/echo/684/niowhnjz/websocket"));

      channel.sink.add(
          '["{\"_event\":\"bulk-subscribe\",\"tzID\":8,\"message\":\"pid-0:%%pid-18:%%isOpenExch-1001:%%pid-50655:%%isOpenExch-1003:%%pid-17:%%isOpenExch-1002:%%pid-66:%%pid-1:%%pid-97:%%pid-2:%%pid-6408:%%isOpenExch-2:%%pid-6369:%%pid-243:%%isOpenExch-1:%%pid-267:%%pid-7888:%%pid-358:%%isOpenExch-4:%%pid-402:%%isOpenExch-9:%%isOpenExch-49:%%pid-8830:%%isOpenExch-1004:%%pid-8836:%%pid-8833:%%pid-8849:%%pid-8851:%%pid-8831:%%pid-8910:%%pid-172:%%pid-27:%%isOpenExch-3:%%pid-166:%%pid-169:%%pid-20:%%pid-13665:%%isOpenExch-40:%%pid-178:%%isOpenExch-20:%%pid-19581:%%pid-19412:%%pid-19454:%%pid-19294:%%pid-19394:%%pid-19522:%%pid-19430:%%pid-3:%%pid-9:%%pid-126:%%pid-1142417:%%pid-19155:%%pid-1175153:%%isOpenExch-152:%%pid-8827:%%pidExt-18:%%cmt-10-5-18:%%pid-2186:%%pid-1031023:\"}"]');
      channel.stream.listen((event) {
        print(event);
      });

      await Future.delayed(const Duration(seconds: 5));
    },
  );

  test(
    "Foreks.com Test",
    () async {
      print(Uri.parse("wss://ws.foreks.com/websocket").toString());
      var channel =
          WebSocketChannel.connect(Uri.parse("wss://ws.foreks.com/websocket"));
      channel.stream.handleError((dads) {
        print(dads);
      });
      channel.sink.add({
        "info": {
          "app-name": "foreks-com",
          "client-address": "https://www.foreks.com",
          "client-language": "tr-TR",
          "company": "foreks",
          "resource": "server"
        },
        "password": "v4a!K%2R",
        "resource": "server",
        "user": "foreks.com",
        "_id": 64
      });
      channel.sink.add({
        "fields": ["E", "l", "C", "c", "O", "b", "a", "h", "L"],
        "id": 115,
        "symbols": ["o18", "o17"],
        "_id": 1
      });
      channel.stream.listen((event) {
        print(event);
      }, onDone: () {
        print("OnDone");
        print("Dee${channel.closeReason}");
      }, onError: (_) {
        print("OnError $_");
      });
      Timer.periodic(const Duration(seconds: 9), (timer) {
        channel.sink.add({"_id": 16});
      });
      // id++;
      // for (var symbol in symbols) {
      //   for (var detail in currencyDetailList) {
      //     print("İd: $id");
      //     channel.sink.add({
      //       "_id": 1,
      //       "id": id,
      //       "symbols": [symbol],
      //       "fields": [detail]
      //     });
      //     id++;
      //   }
      // }
      await Future.delayed(const Duration(seconds: 10));
    },
  );
}
