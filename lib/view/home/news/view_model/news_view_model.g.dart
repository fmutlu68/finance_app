// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewsViewModel on _NewsViewModelBase, Store {
  final _$headlineIndexAtom = Atom(name: '_NewsViewModelBase.headlineIndex');

  @override
  int get headlineIndex {
    _$headlineIndexAtom.reportRead();
    return super.headlineIndex;
  }

  @override
  set headlineIndex(int value) {
    _$headlineIndexAtom.reportWrite(value, super.headlineIndex, () {
      super.headlineIndex = value;
    });
  }

  final _$_NewsViewModelBaseActionController =
      ActionController(name: '_NewsViewModelBase');

  @override
  void updateIndex(int newIndex) {
    final _$actionInfo = _$_NewsViewModelBaseActionController.startAction(
        name: '_NewsViewModelBase.updateIndex');
    try {
      return super.updateIndex(newIndex);
    } finally {
      _$_NewsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
headlineIndex: ${headlineIndex}
    ''';
  }
}
