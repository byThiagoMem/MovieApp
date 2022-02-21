import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/model/shimmer_state_model.dart';
import '../../model/tv_show.dart';
import '../../services/tv_show/tv_show_service.dart';

part 'on_the_air_tv_store.g.dart';

class OnTheAirTvStore = _OnTheAirTvStoreBase with _$OnTheAirTvStore;

abstract class _OnTheAirTvStoreBase with Store {
  final _tvShowService = Modular.get<TvShowService>();

  final ShimmerState<List<TvShow>> onTheAirTv = ShimmerState<List<TvShow>>();

  Future<void> load({bool? reload}) async {
    if (reload != null && reload) onTheAirTv.setReloading();
    (await _tvShowService.getOnTheAirTv()).result(
      (data) => onTheAirTv.setData(data),
      (error) => onTheAirTv.setError(error),
    );
  }
}
