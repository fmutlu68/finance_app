// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DiaryViewModel on _DiaryViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_DiaryViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$dateAtom = Atom(name: '_DiaryViewModelBase.date');

  @override
  DateTime get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(DateTime value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  final _$calendarDataListAtom =
      Atom(name: '_DiaryViewModelBase.calendarDataList');

  @override
  ObservableList<CalendarData> get calendarDataList {
    _$calendarDataListAtom.reportRead();
    return super.calendarDataList;
  }

  @override
  set calendarDataList(ObservableList<CalendarData> value) {
    _$calendarDataListAtom.reportWrite(value, super.calendarDataList, () {
      super.calendarDataList = value;
    });
  }

  final _$filteredCalendarDataListAtom =
      Atom(name: '_DiaryViewModelBase.filteredCalendarDataList');

  @override
  ObservableList<CalendarData> get filteredCalendarDataList {
    _$filteredCalendarDataListAtom.reportRead();
    return super.filteredCalendarDataList;
  }

  @override
  set filteredCalendarDataList(ObservableList<CalendarData> value) {
    _$filteredCalendarDataListAtom
        .reportWrite(value, super.filteredCalendarDataList, () {
      super.filteredCalendarDataList = value;
    });
  }

  final _$searchOperationAtom =
      Atom(name: '_DiaryViewModelBase.searchOperation');

  @override
  CancelableOperation<dynamic> get searchOperation {
    _$searchOperationAtom.reportRead();
    return super.searchOperation;
  }

  @override
  set searchOperation(CancelableOperation<dynamic> value) {
    _$searchOperationAtom.reportWrite(value, super.searchOperation, () {
      super.searchOperation = value;
    });
  }

  final _$searchTextAtom = Atom(name: '_DiaryViewModelBase.searchText');

  @override
  String get searchText {
    _$searchTextAtom.reportRead();
    return super.searchText;
  }

  @override
  set searchText(String value) {
    _$searchTextAtom.reportWrite(value, super.searchText, () {
      super.searchText = value;
    });
  }

  final _$_DiaryViewModelBaseActionController =
      ActionController(name: '_DiaryViewModelBase');

  @override
  void setLoading(bool newLoading) {
    final _$actionInfo = _$_DiaryViewModelBaseActionController.startAction(
        name: '_DiaryViewModelBase.setLoading');
    try {
      return super.setLoading(newLoading);
    } finally {
      _$_DiaryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDate(DateTime newDate) {
    final _$actionInfo = _$_DiaryViewModelBaseActionController.startAction(
        name: '_DiaryViewModelBase.setDate');
    try {
      return super.setDate(newDate);
    } finally {
      _$_DiaryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String text) {
    final _$actionInfo = _$_DiaryViewModelBaseActionController.startAction(
        name: '_DiaryViewModelBase.setSearchText');
    try {
      return super.setSearchText(text);
    } finally {
      _$_DiaryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchOperation(String text) {
    final _$actionInfo = _$_DiaryViewModelBaseActionController.startAction(
        name: '_DiaryViewModelBase.setSearchOperation');
    try {
      return super.setSearchOperation(text);
    } finally {
      _$_DiaryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCalendarDataList(List<CalendarData> list) {
    final _$actionInfo = _$_DiaryViewModelBaseActionController.startAction(
        name: '_DiaryViewModelBase.setCalendarDataList');
    try {
      return super.setCalendarDataList(list);
    } finally {
      _$_DiaryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilteredCalendarDataList(List<CalendarData> list) {
    final _$actionInfo = _$_DiaryViewModelBaseActionController.startAction(
        name: '_DiaryViewModelBase.setFilteredCalendarDataList');
    try {
      return super.setFilteredCalendarDataList(list);
    } finally {
      _$_DiaryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
date: ${date},
calendarDataList: ${calendarDataList},
filteredCalendarDataList: ${filteredCalendarDataList},
searchOperation: ${searchOperation},
searchText: ${searchText}
    ''';
  }
}
