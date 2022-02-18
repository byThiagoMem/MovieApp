// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shimmer_state_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ShimmerState<T> on _ShimmerStateBase<T>, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_ShimmerStateBase.isLoading'))
          .value;
  Computed<StateType>? _$stateComputed;

  @override
  StateType get state =>
      (_$stateComputed ??= Computed<StateType>(() => super.state,
              name: '_ShimmerStateBase.state'))
          .value;

  final _$_stateAtom = Atom(name: '_ShimmerStateBase._state');

  @override
  StateType get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(StateType value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  final _$_reloadingAtom = Atom(name: '_ShimmerStateBase._reloading');

  @override
  bool get _reloading {
    _$_reloadingAtom.reportRead();
    return super._reloading;
  }

  @override
  set _reloading(bool value) {
    _$_reloadingAtom.reportWrite(value, super._reloading, () {
      super._reloading = value;
    });
  }

  final _$_ShimmerStateBaseActionController =
      ActionController(name: '_ShimmerStateBase');

  @override
  void setInitial() {
    final _$actionInfo = _$_ShimmerStateBaseActionController.startAction(
        name: '_ShimmerStateBase.setInitial');
    try {
      return super.setInitial();
    } finally {
      _$_ShimmerStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setReloading([bool loading = true]) {
    final _$actionInfo = _$_ShimmerStateBaseActionController.startAction(
        name: '_ShimmerStateBase.setReloading');
    try {
      return super.setReloading(loading);
    } finally {
      _$_ShimmerStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setData(T data) {
    final _$actionInfo = _$_ShimmerStateBaseActionController.startAction(
        name: '_ShimmerStateBase.setData');
    try {
      return super.setData(data);
    } finally {
      _$_ShimmerStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(Failure error) {
    final _$actionInfo = _$_ShimmerStateBaseActionController.startAction(
        name: '_ShimmerStateBase.setError');
    try {
      return super.setError(error);
    } finally {
      _$_ShimmerStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
state: ${state}
    ''';
  }
}
