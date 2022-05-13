import 'dart:io';

import 'package:finance_app/core/enum/network_request_types.dart';
import 'package:finance_app/core/extensions/cookie_extension.dart';
import 'package:finance_app/core/start/network/service/network_manager.dart';
import 'package:flutter_test/flutter_test.dart';

import 'models/currency_result_info.dart';

main() {
  setUp(() {});
  test("News Api Test", () async {
    final response = await NetworkManager.instance.coreDio
        .sendRequest<CurrencyResultInfo, List<CurrencyResultInfo>>(
      requestType: NetworkRequestType.get,
      path:
          "https://www.foreks.com/api/historical/history?symbol=USD/TRL&resolution=1D&from=1619184456000&to=1650720516000",
      parserModel: CurrencyResultInfo(),
      headers: {}..addCookies([
          Cookie("token",
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImZvcmVrcy5jb20iLCJwYXNzd29yZCI6InY0YSFLJTJSIiwiaWF0IjoxNjUwNzIwNDUzfQ.xgfNz83Q0hsijYNM1fB3QQCwSVzbJU2-ZrkU3CzILxs")
        ]),
    );
    print(response.data?.length);
  });
}
