import 'package:finance_app/core/features/cookie/cookie_helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    "Cookie Test",
    () async {
      final response = await CookieHelper.instance
          .getCookieBy(Uri.parse("https://www.foreks.com/"), "token");
      print(response.value);
    },
  );
}
