import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/model/shimmer_state_model.dart';
import '../../../model/movie/movie.dart';
import '../../../services/movie/movies_services.dart';

part 'top_rated_movies_store.g.dart';

class TopRatedMoviesStore = _TopRatedStoreBase with _$TopRatedMoviesStore;

abstract class _TopRatedStoreBase with Store {
  final _moviesServices = Modular.get<MoviesServices>();

  ShimmerState<List<Movie>> topRatedMovies = ShimmerState<List<Movie>>();

  Future<void> load({bool? reload}) async {
    if (reload != null && reload) topRatedMovies.setReloading();
    (await _moviesServices.getTopRatedMovies()).result(
      (data) => topRatedMovies.setData(data),
      (error) => topRatedMovies.setError(error),
    );
  }
}
