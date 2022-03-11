import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/model/shimmer_state_model.dart';
import '../../../../../movie_design_system/commom/utils/arguments.dart';
import '../../../model/tv_show/tv_show.dart';
import '../../../services/tv_show/tv_show_service.dart';

part 'on_the_air_tv_store.g.dart';

class OnTheAirTvStore = _OnTheAirTvStoreBase with _$OnTheAirTvStore;

abstract class _OnTheAirTvStoreBase with Store {
  final _tvShowService = Modular.get<TvShowService>();

  int _page = 1;

  final ShimmerState<List<TvShow>> onTheAirTv = ShimmerState<List<TvShow>>();

  ObservableList<ScreenData> tvShowsList = ObservableList<ScreenData>.of([]);

  Future<void> load({bool? reload}) async {
    if (reload != null && reload) onTheAirTv.setReloading();
    (await _tvShowService.getOnTheAirTv(page: _page)).result(
      (data) {
        onTheAirTv.setData(data);
        tvShowsList.addAll(TvShow.fromListScreenData(movie: data));
        _page++;
      },
      (error) => onTheAirTv.setError(error),
    );
  }
}
