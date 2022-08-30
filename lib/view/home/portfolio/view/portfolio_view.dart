import 'package:easy_localization/easy_localization.dart';
import 'package:finance_app/core/extensions/lang_extension.dart';
import 'package:finance_app/core/start/lang/locale_keys.g.dart';
import 'package:flutter/material.dart';

class PortfolioView extends StatelessWidget {
  const PortfolioView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(LocaleKeys.portfolio_info.locale));
  }
}
