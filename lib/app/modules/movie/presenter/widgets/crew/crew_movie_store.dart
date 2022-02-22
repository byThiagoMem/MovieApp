import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/model/shimmer_state_model.dart';
import '../../../model/crew/movie_crew.dart';
import '../../../services/movie/movies_services.dart';

part 'crew_movie_store.g.dart';

class CrewMovieStore = _CrewMovieStoreBase with _$CrewMovieStore;

abstract class _CrewMovieStoreBase with Store {
  final _moviesService = Modular.get<MoviesServices>();

  ShimmerState<List<MovieCrew>> crew = ShimmerState<List<MovieCrew>>();

  Future<void> load({required String id}) async {
    (await _moviesService.getCrewMovieById(id: id)).result(
      (data) => crew.setData(data),
      (error) => crew.setError(error),
    );
  }
}
