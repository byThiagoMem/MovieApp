import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/model/shimmer_state_model.dart';
import '../../../model/tv_show/tv_show.dart';
import '../../../services/tv_show/tv_show_service.dart';

part 'tv_show_banner_store.g.dart';

class TvShowBannerStore = _TvShowBannerStoreBase with _$TvShowBannerStore;

abstract class _TvShowBannerStoreBase with Store {
  final _tvShowService = Modular.get<TvShowService>();

  ShimmerState<List<TvShow>> aringTodayTvShows = ShimmerState<List<TvShow>>();

  List<TvShow> get aringTodayTvShowsList => aringTodayTvShows.data!;

  Future<void> load({bool? reload}) async {
    if (reload != null && reload) aringTodayTvShows.setReloading();
    (await _tvShowService.getAiringTodayTv()).result(
      (data) => aringTodayTvShows.setData(data),
      (error) => aringTodayTvShows.setError(error),
    );
  }
}
