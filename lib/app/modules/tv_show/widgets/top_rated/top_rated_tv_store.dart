import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/model/shimmer_state_model.dart';
import '../../model/tv_show.dart';
import '../../services/tv_show/tv_show_service.dart';

part 'top_rated_tv_store.g.dart';

class TopRatedTvStore = _TopRatedTvStoreBase with _$TopRatedTvStore;

abstract class _TopRatedTvStoreBase with Store {
  final _tvShowService = Modular.get<TvShowService>();

  final ShimmerState<List<TvShow>> topRatedTv = ShimmerState<List<TvShow>>();

  Future<void> load({bool? reload}) async {
    if (reload != null && reload) topRatedTv.setReloading();
    (await _tvShowService.getTopRatedTv()).result(
      (data) => topRatedTv.setData(data),
      (error) => topRatedTv.setError(error),
    );
  }
}
