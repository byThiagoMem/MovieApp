import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/model/shimmer_state_model.dart';
import '../../../model/crew/tv_show_crew.dart';
import '../../../services/tv_show/tv_show_service.dart';

part 'crew_tv_show_store.g.dart';

class CrewTvShowStore = _CrewTvShowStoreBase with _$CrewTvShowStore;

abstract class _CrewTvShowStoreBase with Store {
  final _tvShowService = Modular.get<TvShowService>();

  ShimmerState<List<TvShowCrew>> crew = ShimmerState<List<TvShowCrew>>();

  Future<void> load({required String id}) async {
    (await _tvShowService.getCrewTvById(id: id)).result(
      (data) => crew.setData(data),
      (error) => crew.setError(error),
    );
  }
}
