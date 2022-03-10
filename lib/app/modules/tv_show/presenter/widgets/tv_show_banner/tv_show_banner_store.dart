import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/model/shimmer_state_model.dart';
import '../../../../../movie_design_system/commom/utils/arguments.dart';
import '../../../model/tv_show/tv_show.dart';
import '../../../services/tv_show/tv_show_service.dart';

part 'tv_show_banner_store.g.dart';

class TvShowBannerStore = _TvShowBannerStoreBase with _$TvShowBannerStore;

abstract class _TvShowBannerStoreBase with Store {
  final _tvShowService = Modular.get<TvShowService>();

  int _page = 1;

  ShimmerState<List<TvShow>> aringTodayTvShows = ShimmerState<List<TvShow>>();

  ObservableList<ScreenData> tvShowsList = ObservableList<ScreenData>.of([]);

  Future<void> load({bool? reload}) async {
    if (reload != null && reload) aringTodayTvShows.setReloading();
    (await _tvShowService.getAiringTodayTv(page: _page)).result(
      (data) {
        aringTodayTvShows.setData(data);
        tvShowsList.addAll(TvShow.fromListScreenData(movie: data));
        _page++;
      },
      (error) => aringTodayTvShows.setError(error),
    );
  }
}
