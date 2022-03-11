import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/model/shimmer_state_model.dart';
import '../../../../../movie_design_system/commom/utils/arguments.dart';
import '../../../model/tv_show/tv_show.dart';
import '../../../services/tv_show/tv_show_service.dart';

part 'popular_tv_store.g.dart';

class PopularTvStore = _PopularTvStoreBase with _$PopularTvStore;

abstract class _PopularTvStoreBase with Store {
  final _tvShowService = Modular.get<TvShowService>();

  int _page = 1;

  final ShimmerState<List<TvShow>> popularTv = ShimmerState<List<TvShow>>();

  ObservableList<ScreenData> tvShowsList = ObservableList<ScreenData>.of([]);

  Future<void> load({bool? reload}) async {
    if (reload != null && reload) popularTv.setReloading();
    (await _tvShowService.getPopularTv(page: _page)).result(
      (data) {
        popularTv.setData(data);
        tvShowsList.addAll(TvShow.fromListScreenData(movie: data));
        _page++;
      },
      (error) => popularTv.setError(error),
    );
  }
}
