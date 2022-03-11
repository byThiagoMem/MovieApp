import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/model/shimmer_state_model.dart';
import '../../../../../movie_design_system/commom/utils/arguments.dart';
import '../../../model/tv_show/tv_show.dart';
import '../../../services/tv_show/tv_show_service.dart';

part 'top_rated_tv_store.g.dart';

class TopRatedTvStore = _TopRatedTvStoreBase with _$TopRatedTvStore;

abstract class _TopRatedTvStoreBase with Store {
  final _tvShowService = Modular.get<TvShowService>();

  int _page = 1;

  final ShimmerState<List<TvShow>> topRatedTv = ShimmerState<List<TvShow>>();

  ObservableList<ScreenData> tvShowsList = ObservableList<ScreenData>.of([]);

  Future<void> load({bool? reload}) async {
    if (reload != null && reload) topRatedTv.setReloading();
    (await _tvShowService.getTopRatedTv(page: _page)).result(
      (data) {
        topRatedTv.setData(data);
        tvShowsList.addAll(TvShow.fromListScreenData(movie: data));
        _page++;
      },
      (error) => topRatedTv.setError(error),
    );
  }
}
