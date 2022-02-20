import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/model/shimmer_state_model.dart';
import '../../model/movie/movie.dart';
import '../../services/movie/movies_services.dart';

part 'movie_banner_store.g.dart';

class MovieBannerStore = _MovieBannerStoreBase with _$MovieBannerStore;

abstract class _MovieBannerStoreBase with Store {
  final _moviesService = Modular.get<MoviesServices>();

  ShimmerState<List<Movie>> nowPlayingMovies = ShimmerState<List<Movie>>();

  List<Movie> get movies => nowPlayingMovies.data!;

  void getNowPlayingMovies() async {
    (await _moviesService.getNowPlayingMovies()).result(
      (data) => nowPlayingMovies.setData(data),
      (error) => nowPlayingMovies.setError(error),
    );
  }
}
