// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presentation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PresentationStore on _PresentationStoreBase, Store {
  final _$currentPageAtom = Atom(name: '_PresentationStoreBase.currentPage');

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$_PresentationStoreBaseActionController =
      ActionController(name: '_PresentationStoreBase');

  @override
  void setCurrentPage(int value) {
    final _$actionInfo = _$_PresentationStoreBaseActionController.startAction(
        name: '_PresentationStoreBase.setCurrentPage');
    try {
      return super.setCurrentPage(value);
    } finally {
      _$_PresentationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage}
    ''';
  }
}
