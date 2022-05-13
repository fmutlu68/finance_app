import 'dart:io';

extension CookieMapExtension on Map {
  addCookies(List<Cookie> cookies) {
    this["cookie"] = _getCookiesAsString(cookies);
  }

  String _getCookiesAsString(List<Cookie> cookies) {
    return cookies.map<String>((e) => "${e.name}=${e.value}").join(";");
  }
}
