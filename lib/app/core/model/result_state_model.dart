import 'package:mobx/mobx.dart';

import 'failure.dart';
import 'result.dart';

part 'result_state_model.g.dart';

enum ResultStateType { IDLE, LOADING, SUCCESS, ERROR }

typedef LoadingResult<T> = void Function(bool loading);
typedef SuccessResult<T> = void Function(T data);
typedef ErrorResult = void Function(Failure error);

class ResultState<T> = _ResultStateBase<T> with _$ResultState;

abstract class _ResultStateBase<T> with Store {
  @observable
  ResultStateType _state = ResultStateType.IDLE;

  bool _loading = false;

  ResultStateType get state => _state;

  T? _data;
  T? get data => _data;

  Failure? _error;
  Failure? get error => _error;

  @action
  // ignore: avoid_positional_boolean_parameters
  void setLoading(bool loading) {
    _loading = loading;
    _state = ResultStateType.LOADING;
  }

  @action
  void setData(T data) {
    _data = data;
    _state = ResultStateType.SUCCESS;
  }

  @action
  void setError(Failure error) {
    _error = error;
    _state = ResultStateType.ERROR;
  }

  void makeRequest(Future<Result<T>> request) async {
    setLoading(true);
    (await request).result(setData, setError);
  }

  ReactionDisposer handleState(
      LoadingResult loading, SuccessResult<T> success, ErrorResult error) {
    return reaction((_) => _state, (_) {
      switch (_state) {
        case ResultStateType.LOADING:
          loading(_loading);
          break;
        case ResultStateType.ERROR:
          if (_loading) {
            _loading = false;
            loading(_loading);
          }
          error(_error!);
          break;
        case ResultStateType.SUCCESS:
          if (_loading) {
            _loading = false;
            loading(_loading);
          }
          success(_data!);
          break;
        case ResultStateType.IDLE:
          break;
      }
    });
  }
}
