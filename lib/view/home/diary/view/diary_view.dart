import 'package:finance_app/core/base/widget/base_view.dart';
import 'package:finance_app/core/components/list_view/fields/custom_text_field.dart';
import 'package:finance_app/core/extensions/padding_extension.dart';
import 'package:finance_app/core/models/components/fields/text_field_properties.dart';
import 'package:finance_app/production/features/finance_data/extension/date_extension.dart';
import 'package:finance_app/production/features/finance_data/models/res/calendar_data.dart';
import 'package:finance_app/view/home/diary/pages/calendar_data_detail_dialog.dart';
import 'package:finance_app/view/home/diary/view_model/diary_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/state/base_view_state.dart';

part '../components/diary_view_search_calendar_data_field.dart';

class DiaryView extends StatefulWidget {
  const DiaryView({Key? key}) : super(key: key);

  @override
  State<DiaryView> createState() => _DiaryViewState();
}

class _DiaryViewState extends BaseViewState<DiaryView> {
  late DiaryViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<DiaryViewModel>(
      viewModel: DiaryViewModel(),
      onModelReady: (model) async {
        viewModel = model;
        viewModel.setContext(context);
        viewModel.init();
        await viewModel.loadData();
      },
      onPageBuilder: (context, model) => SafeArea(
          child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Padding(
              padding: context.veryLowSymPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildDateButton,
                  buildFilterDataListButton,
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: calculateDynamicWidth(2),
                  left: calculateDynamicWidth(2),
                  bottom: calculateDynamicHeight(2)),
              child: buildSearchField,
            ),
            Expanded(child: buildTable),
          ],
        ),
      )),
      onDispose: () {},
    );
  }

  Widget get buildTable {
    return Observer(
      builder: (context) {
        return viewModel.searchText == ""
            ? buildNonFilteredTable
            : buildFilteredTable;
      },
    );
  }

  get buildFilteredTable {
    return Observer(
      builder: (context) {
        if (viewModel.filteredCalendarDataList.isEmpty) {
          return const Center(
            child: Text("Aradığınız Veri Bulunamadı."),
          );
        } else {
          return buildTableList(viewModel.filteredCalendarDataList);
        }
      },
    );
  }

  get buildNonFilteredTable {
    return Observer(
      builder: (context) {
        if (viewModel.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (!viewModel.isLoading && viewModel.calendarDataList.isEmpty) {
          return const Center(
            child: Text("Veriler Yüklenemedi"),
          );
        } else {
          return buildTableList(viewModel.calendarDataList);
        }
      },
    );
  }

  Widget buildTableList(ObservableList<CalendarData> calendarDataList) {
    return SingleChildScrollView(
      controller: viewModel.dataTableScrollController,
      child: DataTable(
        columns: const [
          DataColumn(label: Text("Saat")),
          DataColumn(label: Text("Ülke")),
          DataColumn(label: Text("Başlık")),
        ],
        rows: calendarDataList
            .map<DataRow>(
              (element) => DataRow(
                cells: [
                  DataCell(Text(element.time)),
                  DataCell(Text(element.country)),
                  DataCell(buildCalendarDataTitleText(element)),
                ],
              ),
            )
            .toList(),
      ),
    );
  }

  GestureDetector buildCalendarDataTitleText(CalendarData element) =>
      GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (_) => CalendarDataDetailDialog(data: element));
        },
        child: Text(
          element.title,
          style: const TextStyle(color: Colors.blue),
        ),
      );

  get buildDateButton => Observer(
        builder: (context) => ActionChip(
          label: Text(viewModel.date.dateAsStringFormatted),
          onPressed: () async {
            DateTime? selected = await showDatePicker(
              context: context,
              initialDate: viewModel.date,
              firstDate: DateTime(DateTime.now().year - 1),
              lastDate: DateTime.now(),
            );
            if (selected != null) viewModel.setDate(selected);
          },
        ),
      );
  Widget get buildFilterDataListButton => Observer(
        builder: (context) => ActionChip(
          label: Text(viewModel.isLoading ? "Getiriliyor" : "Getir"),
          onPressed: viewModel.isLoading
              ? () {}
              : () async {
                  await viewModel.loadData();
                },
          backgroundColor: Colors.blueAccent,
        ),
      );
}
