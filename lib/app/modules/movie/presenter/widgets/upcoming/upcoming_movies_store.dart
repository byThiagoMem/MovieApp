import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/model/shimmer_state_model.dart';
import '../../../../../movie_design_system/commom/utils/arguments.dart';
import '../../../model/movie/movie.dart';
import '../../../services/movie/movies_services.dart';

part 'upcoming_movies_store.g.dart';

class UpcomingMoviesStore = _UpcomingStoreBase with _$UpcomingMoviesStore;

abstract class _UpcomingStoreBase with Store {
  final _moviesServices = Modular.get<MoviesServices>();

  int _page = 1;

  ObservableList<ScreenData> movies = ObservableList<ScreenData>.of([]);

  ShimmerState<List<Movie>> upcomingMovies = ShimmerState<List<Movie>>();

  Future<void> load({bool? reload}) async {
    if (reload != null && reload) upcomingMovies.setReloading();
    (await _moviesServices.getUpcomingMovies(page: _page)).result(
      (data) {
        upcomingMovies.setData(data);
        movies.addAll(Movie.fromListScreenData(movies: data));
        _page++;
      },
      (error) => upcomingMovies.setError(error),
    );
  }
}
