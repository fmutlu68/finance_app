// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  final _$selectedPageAtom = Atom(name: '_HomeViewModelBase.selectedPage');

  @override
  int get selectedPage {
    _$selectedPageAtom.reportRead();
    return super.selectedPage;
  }

  @override
  set selectedPage(int value) {
    _$selectedPageAtom.reportWrite(value, super.selectedPage, () {
      super.selectedPage = value;
    });
  }

  final _$currentRouteAtom = Atom(name: '_HomeViewModelBase.currentRoute');

  @override
  Route<dynamic>? get currentRoute {
    _$currentRouteAtom.reportRead();
    return super.currentRoute;
  }

  @override
  set currentRoute(Route<dynamic>? value) {
    _$currentRouteAtom.reportWrite(value, super.currentRoute, () {
      super.currentRoute = value;
    });
  }

  final _$appCloseableAtom = Atom(name: '_HomeViewModelBase.appCloseable');

  @override
  bool get appCloseable {
    _$appCloseableAtom.reportRead();
    return super.appCloseable;
  }

  @override
  set appCloseable(bool value) {
    _$appCloseableAtom.reportWrite(value, super.appCloseable, () {
      super.appCloseable = value;
    });
  }

  final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase');

  @override
  void setIndex(int newIndex) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.setIndex');
    try {
      return super.setIndex(newIndex);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRoute(Route<dynamic> newRoute) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.setRoute');
    try {
      return super.setRoute(newRoute);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCloseable(bool close) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.setCloseable');
    try {
      return super.setCloseable(close);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedPage: ${selectedPage},
currentRoute: ${currentRoute},
appCloseable: ${appCloseable}
    ''';
  }
}
