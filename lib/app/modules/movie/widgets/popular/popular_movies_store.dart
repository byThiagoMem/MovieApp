import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/model/shimmer_state_model.dart';
import '../../model/movie/movie.dart';
import '../../services/movie/movies_services.dart';

part 'popular_movies_store.g.dart';

class PopularMoviesStore = _PopularStoreBase with _$PopularMoviesStore;

abstract class _PopularStoreBase with Store {
  final _moviesService = Modular.get<MoviesServices>();

  final ShimmerState<List<Movie>> popularMovies = ShimmerState<List<Movie>>();

  Future<void> load({bool? reload}) async {
    if (reload != null && reload) popularMovies.setReloading();
    (await _moviesService.getNowPlayingMovies()).result(
      (data) => popularMovies.setData(data),
      (error) => popularMovies.setError(error),
    );
  }
}
