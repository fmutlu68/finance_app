import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:finance_app/core/base/widget/base_view.dart';
import 'package:finance_app/core/extensions/lang_extension.dart';
import 'package:finance_app/core/extensions/theme_extension.dart';
import 'package:finance_app/core/start/lang/language_starter.dart';
import 'package:finance_app/core/start/lang/locale_keys.g.dart';
import 'package:finance_app/core/start/theme/theme_notifier.dart';
import 'package:finance_app/view/home/options/model/option_model.dart';
import 'package:finance_app/view/home/options/view_model/options_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/state/base_view_state.dart';

class OptionsView extends StatefulWidget {
  const OptionsView({Key? key}) : super(key: key);

  @override
  State<OptionsView> createState() => _OptionsViewState();
}

class _OptionsViewState extends BaseViewState<OptionsView> {
  late OptionsViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<OptionsViewModel>(
      viewModel: OptionsViewModel(),
      onModelReady: (model) {
        viewModel = model;
        viewModel.setContext(context);
        viewModel.init();
      },
      onPageBuilder: (context, model) => SafeArea(
        child: Column(
          children: [
            AppBar(
              leading: const SizedBox(),
              title: Text(LocaleKeys.optionsView_title.locale),
              leadingWidth: 0,
            ),
            buildOptionsCategoryTile(LocaleKeys.optionsView_frontend.locale),
            buildOptionTile(
              OptionModel(
                title: LocaleKeys.optionsView_darkMode.locale,
                leading: const Icon(Icons.brightness_2_sharp),
                trailing: Switch(
                  value:
                      context.watch<ThemeNotifier>().getTheme == ThemeMode.dark,
                  onChanged: (_) => context.read<ThemeNotifier>().changeTheme(),
                ),
              ),
            ),
            buildOptionTile(
              OptionModel(
                title: LocaleKeys.optionsView_lang.locale,
                leading: const Icon(Icons.language),
                trailing: const Icon(Icons.arrow_right_alt),
                onClicked: () {
                  if (context.locale.countryCode == "US") {
                    context.setLocale(LanguageStarter.instance.trLocale);
                  } else {
                    context.setLocale(LanguageStarter.instance.enLocale);
                  }
                },
              ),
            ),
            buildOptionsCategoryTile(
                LocaleKeys.optionsView_otherOptions.locale),
            buildOptionTile(
              OptionModel(
                title: LocaleKeys.optionsView_notification.locale,
                leading: const Icon(Icons.notifications),
                trailing: const Icon(Icons.arrow_right_alt),
                onClicked: () {},
              ),
            ),
            buildOptionTile(
              OptionModel(
                title: LocaleKeys.optionsView_statistics.locale,
                leading: const Icon(Icons.leaderboard),
                trailing: const Icon(Icons.arrow_right_alt),
                onClicked: () {},
              ),
            ),
            buildOptionTile(
              OptionModel(
                title: LocaleKeys.optionsView_exit.locale,
                color: Colors.red,
                leading: const Icon(Icons.exit_to_app),
                trailing: const Icon(Icons.arrow_right_alt),
                onClicked: () {
                  exit(0);
                },
              ),
            ),
          ],
        ),
      ),
      onDispose: () {},
    );
  }

  buildOptionTile(OptionModel model) {
    return Card(
      child: ListTile(
        title: Text(
          model.title,
          style: context.textTheme.subtitle1
              ?.copyWith(fontWeight: FontWeight.bold, color: model.color),
        ),
        subtitle: model.subtitle != null ? Text(model.subtitle!) : null,
        leading: model.leading,
        trailing: model.trailing,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: context.colors.background,
          ),
        ),
        onTap: model.onClicked,
      ),
    );
  }

  buildOptionsCategoryTile(String title) {
    return ListTile(
      // dense: true,
      title: Text(
        title,
        style: context.textTheme.bodyText1?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      tileColor: context.colors.background.withOpacity(0.15),
    );
  }
}
