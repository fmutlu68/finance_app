import 'dart:io';

extension CookieMapExtension on Map {
  addCookies(List<Cookie> cookies) {
    this["cookie"] = _getCookiesAsString(cookies);
  }

  String _getCookiesAsString(List<Cookie> cookies) {
    return cookies.map<String>((e) => "${e.name}=${e.value}").join(";");
  }
}

extension CookieStringExtension on String {
  Map get getCookies {
    List<String> parsedValues = split(";")
      ..removeWhere((element) => element.isEmpty || !element.contains("="));
    Map cookies = {};
    for (var parsedValue in parsedValues) {
      cookies[parsedValue.split("=")[0]] = parsedValue.split("=")[1];
    }
    return cookies;
  }
}
