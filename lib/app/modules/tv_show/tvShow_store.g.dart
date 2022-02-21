// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tvShow_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TvShowStore on _TvShowStoreBase, Store {
  final _$valueAtom = Atom(name: '_TvShowStoreBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_TvShowStoreBaseActionController =
      ActionController(name: '_TvShowStoreBase');

  @override
  void increment() {
    final _$actionInfo = _$_TvShowStoreBaseActionController.startAction(
        name: '_TvShowStoreBase.increment');
    try {
      return super.increment();
    } finally {
      _$_TvShowStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
