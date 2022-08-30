import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:finance_app/core/base/widget/base_view.dart';
import 'package:finance_app/core/extensions/dynamic_size_extension.dart';
import 'package:finance_app/core/extensions/lang_extension.dart';
import 'package:finance_app/core/extensions/theme_extension.dart';
import 'package:finance_app/core/extensions/theme_mode_extension.dart';
import 'package:finance_app/core/models/components/list_view/card_list_item.dart';
import 'package:finance_app/core/start/lang/language_starter.dart';
import 'package:finance_app/core/start/lang/locale_keys.g.dart';
import 'package:finance_app/core/start/theme/theme_notifier.dart';
import 'package:finance_app/view/home/options/model/option_model.dart';
import 'package:finance_app/view/home/options/view_model/options_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/state/base_view_state.dart';
import '../../../../core/components/list_view/cards_list_view.dart';

class OptionsView extends StatefulWidget {
  const OptionsView({Key? key}) : super(key: key);

  @override
  State<OptionsView> createState() => _OptionsViewState();
}

class _OptionsViewState extends BaseViewState<OptionsView> {
  late OptionsViewModel viewModel;
  late Locale selectedLang;
  @override
  Widget build(BuildContext context) {
    return BaseView<OptionsViewModel>(
      viewModel: OptionsViewModel(),
      onModelReady: (model) {
        viewModel = model;
        viewModel.setContext(context);
        viewModel.init();
        selectedLang = EasyLocalization.of(context)!.locale;
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
            CardsListView(
              text: LocaleKeys.optionsView_themeMode.locale,
              bgColor: context.colors.background.withOpacity(0.60),
              items: [
                ThemeMode.dark.itemInfo,
                ThemeMode.light.itemInfo,
                ThemeMode.system.itemInfo,
              ],
              selectedItem: context.watch<ThemeNotifier>().getTheme ==
                      ThemeMode.system
                  ? ThemeMode.system.itemInfo
                  : context.watch<ThemeNotifier>().getTheme == ThemeMode.dark
                      ? ThemeMode.dark.itemInfo
                      : ThemeMode.light.itemInfo,
              selectedItemBorderColor: context.colors.onError,
              unSelectedItemBorderColor: context.colors.primary,
              onSelectedItemChanged: (item) {
                context
                    .read<ThemeNotifier>()
                    .changeThemeByParam(item.bgColor == Colors.black
                        ? ThemeMode.dark
                        : item.bgColor == Colors.white
                            ? ThemeMode.light
                            : ThemeMode.system);
              },
            ),
            const Divider(
              thickness: .8,
              height: .7,
            ),
            StatefulBuilder(
              builder: (context, setBuilderState) {
                return CardsListView<Locale>(
                  text: LocaleKeys.optionsView_lang.locale,
                  bgColor: context.colors.background.withOpacity(0.60),
                  items: [
                    CardListItem(
                        title: "Türkçe",
                        titleColor: Colors.black,
                        bgColor: Colors.grey,
                        data: LanguageStarter.instance.trLocale),
                    CardListItem(
                        title: "English",
                        titleColor: Colors.black,
                        bgColor: Colors.grey,
                        data: LanguageStarter.instance.enLocale)
                  ],
                  itemStyleIsChip: true,
                  selectedValue: selectedLang,
                  selectedItemBorderColor: context.colors.onError,
                  unSelectedItemBorderColor: context.colors.primary,
                  borderWidth: context.calculateDynamicWidth(0.3),
                  onSelectedItemChanged: (item) {
                    setBuilderState(
                      () {
                        selectedLang = item.data!;
                      },
                    );
                    context.setLocale(item.data!);
                  },
                );
              },
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
