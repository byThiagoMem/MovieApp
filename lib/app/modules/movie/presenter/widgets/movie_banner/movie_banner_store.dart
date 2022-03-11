import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/model/shimmer_state_model.dart';
import '../../../../../movie_design_system/commom/utils/arguments.dart';
import '../../../model/movie/movie.dart';
import '../../../services/movie/movies_services.dart';

part 'movie_banner_store.g.dart';

class MovieBannerStore = _MovieBannerStoreBase with _$MovieBannerStore;

abstract class _MovieBannerStoreBase with Store {
  final _moviesService = Modular.get<MoviesServices>();

  int _page = 1;

  ObservableList<ScreenData> movies = ObservableList<ScreenData>.of([]);

  ShimmerState<List<Movie>> nowPlayingMovies = ShimmerState<List<Movie>>();

  Future<void> load({bool? reload}) async {
    if (reload != null && reload) nowPlayingMovies.setReloading();
    (await _moviesService.getNowPlayingMovies(page: _page)).result(
      (data) {
        nowPlayingMovies.setData(data);
        movies.addAll(Movie.fromListScreenData(movies: data));
        _page++;
      },
      (error) => nowPlayingMovies.setError(error),
    );
  }
}
