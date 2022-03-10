import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/model/shimmer_state_model.dart';
import '../../../../../movie_design_system/commom/utils/arguments.dart';
import '../../../model/movie/movie.dart';
import '../../../services/movie/movies_services.dart';

part 'popular_movies_store.g.dart';

class PopularMoviesStore = _PopularStoreBase with _$PopularMoviesStore;

abstract class _PopularStoreBase with Store {
  final _moviesService = Modular.get<MoviesServices>();

  int _page = 1;

  final ShimmerState<List<Movie>> popularMovies = ShimmerState<List<Movie>>();

  ObservableList<ScreenData> movies = ObservableList<ScreenData>.of([]);

  Future<void> load({bool? reload}) async {
    if (reload != null && reload) popularMovies.setReloading();
    (await _moviesService.getPopularMovies(page: _page)).result(
      (data) {
        popularMovies.setData(data);
        movies.addAll(Movie.fromListScreenData(movies: data));
        _page++;
      },
      (error) => popularMovies.setError(error),
    );
  }
}
