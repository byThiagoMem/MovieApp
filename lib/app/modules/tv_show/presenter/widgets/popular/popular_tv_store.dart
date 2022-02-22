import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/model/shimmer_state_model.dart';
import '../../../model/tv_show/tv_show.dart';
import '../../../services/tv_show/tv_show_service.dart';

part 'popular_tv_store.g.dart';

class PopularTvStore = _PopularTvStoreBase with _$PopularTvStore;

abstract class _PopularTvStoreBase with Store {
  final _tvShowService = Modular.get<TvShowService>();

  final ShimmerState<List<TvShow>> popularTv = ShimmerState<List<TvShow>>();

  Future<void> load({bool? reload}) async {
    if (reload != null && reload) popularTv.setReloading();
    (await _tvShowService.getPopularTv()).result(
      (data) => popularTv.setData(data),
      (error) => popularTv.setError(error),
    );
  }
}
