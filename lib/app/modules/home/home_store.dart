import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/model/shimmer_state_model.dart';
import 'model/movie/movie.dart';
import 'services/movies_services.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final _moviesService = Modular.get<MoviesServices>();

  ShimmerState<List<Movie>> upcomingMovies = ShimmerState<List<Movie>>();

  void getMovies() async {
    (await _moviesService.getUpComingMovies()).result(
      (data) => upcomingMovies.setData(data),
      (error) => upcomingMovies.setError(error),
    );
  }
}
