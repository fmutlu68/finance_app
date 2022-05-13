// ignore_for_file: constant_identifier_names

import 'package:easy_localization/easy_localization.dart';
import 'package:finance_app/core/start/theme/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppConstants {
  static const LANG_ASSET_PATH = "assets/lang";
  static String getGraphicURL(BuildContext context, String? marketItemId) {
    if (marketItemId == null) {
      return "";
    }
    ThemeMode currentTheme = context.read<ThemeNotifier>().getTheme;
    return '''
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0">
<div class="tradingview-widget-container">
   <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
  <script type="text/javascript">
  new TradingView.widget(
  {
  "autosize": true,
  "symbol": "$marketItemId",
  "interval": "Y",
  "timezone": "Europe/Istanbul",
  "theme": "${currentTheme == ThemeMode.dark ? "dark" : "light"}",
  "style": "3",
  "locale": "${context.locale.languageCode}",
  "toolbar_bg": "#f1f3f6",
  "enable_publishing": false,
  "save_image": false,
}
  );
  </script>
</div>''';
  }
}
