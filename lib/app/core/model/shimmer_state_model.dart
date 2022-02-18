import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'failure.dart';

part 'shimmer_state_model.g.dart';

enum StateType { INITIAL, SUCCESS, ERROR }

typedef Initial = Widget Function();
typedef Success<T> = Widget Function(T? data);
typedef SuccessLoadable<T> = Widget Function(T data, bool loading);
typedef Error = Widget Function(Failure error);

class ShimmerState<T> = _ShimmerStateBase<T> with _$ShimmerState;

abstract class _ShimmerStateBase<T> with Store {
  _ShimmerStateBase({StateType initialState = StateType.INITIAL})
      : _state = initialState;

  @observable
  StateType _state;

  @observable
  bool _reloading = false;

  @computed
  bool get isLoading => _reloading;

  @computed
  StateType get state => _state;

  T? _data;
  T? get data => _data;

  Failure? _error;
  Failure? get error => _error;

  @action
  void setInitial() {
    _state = StateType.INITIAL;
    _reloading = false;
  }

  @action
  // ignore: avoid_positional_boolean_parameters
  void setReloading([bool loading = true]) {
    _state = StateType.SUCCESS;
    _reloading = loading;
  }

  @action
  void setData(T data) {
    _data = data;
    _state = StateType.SUCCESS;
    _reloading = false;
  }

  @action
  void setError(Failure error) {
    _error = error;
    _state = StateType.ERROR;
    _reloading = false;
  }

  Widget handleState(Initial initial, Success<T> success, [Error? error]) {
    switch (_state) {
      case StateType.INITIAL:
        return initial();
      case StateType.ERROR:
        if (error == null) return const SizedBox();
        return error(_error!);
      default:
        return success(_data);
    }
  }

  Widget handleStateLoadable(
      Initial initial, SuccessLoadable<T> successLoadable, Error error) {
    switch (_state) {
      case StateType.INITIAL:
        return initial();
      case StateType.ERROR:
        return error(_error!);
      default:
        return successLoadable(_data!, _reloading);
    }
  }
}
