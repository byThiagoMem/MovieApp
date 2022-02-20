import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/model/shimmer_state_model.dart';
import 'model/movie/movie.dart';
import 'services/movie/movies_services.dart';

part 'movie_store.g.dart';

class MovieStore = HomeStoreBase with _$MovieStore;

abstract class HomeStoreBase with Store {
  final _moviesService = Modular.get<MoviesServices>();

  ShimmerState<List<Movie>> upcomingMovies = ShimmerState<List<Movie>>();
  ShimmerState<List<Movie>> popularMovies = ShimmerState<List<Movie>>();
  ShimmerState<List<Movie>> topRatedMovies = ShimmerState<List<Movie>>();

  void loadMovies() {
    getUpcomingMovies();
    getPopularMovies();
    getTopRatedMovies();
  }

  void getUpcomingMovies() async {
    (await _moviesService.getUpcomingMovies()).result(
      (data) => upcomingMovies.setData(data),
      (error) => upcomingMovies.setError(error),
    );
  }

  void getPopularMovies() async {
    (await _moviesService.getPopularMovies()).result(
      (data) => popularMovies.setData(data),
      (error) => popularMovies.setError(error),
    );
  }

  void getTopRatedMovies() async {
    (await _moviesService.getTopRatedMovies()).result(
      (data) => topRatedMovies.setData(data),
      (error) => topRatedMovies.setError(error),
    );
  }
}
