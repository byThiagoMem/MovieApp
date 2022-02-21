import 'package:mobx/mobx.dart';

part 'tvShow_store.g.dart';

class TvShowStore = _TvShowStoreBase with _$TvShowStore;
abstract class _TvShowStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}