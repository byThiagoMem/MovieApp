// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_state_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ResultState<T> on _ResultStateBase<T>, Store {
  final _$_stateAtom = Atom(name: '_ResultStateBase._state');

  @override
  ResultStateType get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(ResultStateType value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  final _$_ResultStateBaseActionController =
      ActionController(name: '_ResultStateBase');

  @override
  void setLoading(bool loading) {
    final _$actionInfo = _$_ResultStateBaseActionController.startAction(
        name: '_ResultStateBase.setLoading');
    try {
      return super.setLoading(loading);
    } finally {
      _$_ResultStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setData(T data) {
    final _$actionInfo = _$_ResultStateBaseActionController.startAction(
        name: '_ResultStateBase.setData');
    try {
      return super.setData(data);
    } finally {
      _$_ResultStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(Failure error) {
    final _$actionInfo = _$_ResultStateBaseActionController.startAction(
        name: '_ResultStateBase.setError');
    try {
      return super.setError(error);
    } finally {
      _$_ResultStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
