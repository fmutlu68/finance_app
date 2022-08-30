import 'dart:io';

import 'package:dio/dio.dart';
import 'package:finance_app/core/extensions/cookie_extension.dart';
import 'package:finance_app/core/start/network/service/dio/core_dio.dart';

import '../../start/network/service/dio/i_core_dio.dart';

abstract class ICookieHelper {
  Future<Cookie> getCookieBy(Uri url, String cookieName);
}

class CookieHelper extends ICookieHelper {
  static CookieHelper? _instance;
  static CookieHelper get instance {
    _instance ??= CookieHelper._init();
    return _instance!;
  }

  final ICoreDio _dio;
  CookieHelper._init() : _dio = CoreDio(BaseOptions());

  @override
  Future<Cookie> getCookieBy(Uri url, String cookieName) async {
    Response response = await _dio.getPage(path: url.toString());
    return Cookie(cookieName,
        (response.headers.value("set-cookie") ?? "").getCookies[cookieName]);
  }
}
