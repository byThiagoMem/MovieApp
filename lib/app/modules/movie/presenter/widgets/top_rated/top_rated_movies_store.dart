import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/model/shimmer_state_model.dart';
import '../../../../../movie_design_system/commom/utils/arguments.dart';
import '../../../model/movie/movie.dart';
import '../../../services/movie/movies_services.dart';

part 'top_rated_movies_store.g.dart';

class TopRatedMoviesStore = _TopRatedStoreBase with _$TopRatedMoviesStore;

abstract class _TopRatedStoreBase with Store {
  final _moviesServices = Modular.get<MoviesServices>();

  int _page = 1;

  ObservableList<ScreenData> movies = ObservableList<ScreenData>.of([]);

  ShimmerState<List<Movie>> topRatedMovies = ShimmerState<List<Movie>>();

  Future<void> load({bool? reload}) async {
    if (reload != null && reload) topRatedMovies.setReloading();
    (await _moviesServices.getTopRatedMovies(page: _page)).result(
      (data) {
        topRatedMovies.setData(data);
        movies.addAll(Movie.fromListScreenData(movies: data));
        _page++;
      },
      (error) => topRatedMovies.setError(error),
    );
  }
}
