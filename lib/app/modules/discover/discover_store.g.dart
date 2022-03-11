// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discover_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DiscoverStore on _DiscoverStoreBase, Store {
  final _$isLoadingAtom = Atom(name: '_DiscoverStoreBase.isLoading');

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

  final _$_DiscoverStoreBaseActionController =
      ActionController(name: '_DiscoverStoreBase');

  @override
  void toggleLoading() {
    final _$actionInfo = _$_DiscoverStoreBaseActionController.startAction(
        name: '_DiscoverStoreBase.toggleLoading');
    try {
      return super.toggleLoading();
    } finally {
      _$_DiscoverStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
