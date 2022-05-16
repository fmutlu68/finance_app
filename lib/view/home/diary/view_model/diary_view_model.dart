import 'package:async/async.dart';
import 'package:finance_app/core/base/model/base_view_model.dart';
import 'package:finance_app/production/features/finance_data/models/res/calendar_data.dart';
import 'package:finance_app/production/notifiers/economic_calendar_provider.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'diary_view_model.g.dart';

class DiaryViewModel = _DiaryViewModelBase with _$DiaryViewModel;

abstract class _DiaryViewModelBase with Store, BaseViewModel {
  late TextEditingController searchController;
  late ScrollController dataTableScrollController;
  @override
  void setContext(BuildContext ctx) => pageContext = ctx;
  @observable
  bool isLoading = false;
  @observable
  DateTime date = DateTime.now();
  @observable
  ObservableList<CalendarData> calendarDataList = ObservableList.of([]);
  @observable
  ObservableList<CalendarData> filteredCalendarDataList = ObservableList.of([]);
  @observable
  CancelableOperation searchOperation =
      CancelableOperation.fromFuture(Future.delayed(Duration.zero));
  @observable
  String searchText = "";

  @override
  void init() {
    searchController = TextEditingController();
    searchController.addListener(() => searchListener(searchController.text));
    dataTableScrollController = ScrollController();
  }

  @override
  void onDispose() {}
  @action
  void setLoading(bool newLoading) => isLoading = newLoading;
  @action
  void setDate(DateTime newDate) => date = newDate;
  @action
  void setSearchText(String text) => searchText = text;

  @action
  void setSearchOperation(String text) =>
      searchOperation = CancelableOperation.fromFuture(
        Future.delayed(
          const Duration(seconds: 2),
          () {
            searchCalendarData(text);
          },
        ),
        onCancel: () {
          searchOperation.cancel();
        },
      );

  @action
  void setCalendarDataList(List<CalendarData> list) =>
      calendarDataList = ObservableList.of(list);
  @action
  void setFilteredCalendarDataList(List<CalendarData> list) =>
      filteredCalendarDataList = ObservableList.of(list);

  Future<void> loadData() async {
    setLoading(true);
    setCalendarDataList(await pageContext!
        .read<EconomicCalendarProvider>()
        .getCalendarDataByDate(date));
    setFilteredCalendarDataList([]);
    setSearchText("");
    setLoading(false);
  }

  void searchListener(String text) {
    if (text.isNotEmpty) {
      setSearchOperation(text);
    } else {
      setSearchText("");
      setFilteredCalendarDataList([]);
    }
  }

  void searchCalendarData(String text) {
    setFilteredCalendarDataList(calendarDataList
        .where((element) =>
            element.title.toLowerCase().contains(text.toLowerCase()))
        .toList());
    if (filteredCalendarDataList.isNotEmpty) {
      FocusScope.of(pageContext!).unfocus();
      dataTableScrollController.jumpTo(0);
    }
    setSearchText(text);
  }
}
