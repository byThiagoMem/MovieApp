import 'package:mobx/mobx.dart';

part 'discover_store.g.dart';

class DiscoverStore = _DiscoverStoreBase with _$DiscoverStore;

abstract class _DiscoverStoreBase with Store {
  @observable
  bool isLoading = false;

  @action
  void toggleLoading() => isLoading = !isLoading;
}
