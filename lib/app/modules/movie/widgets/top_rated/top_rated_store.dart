import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/model/shimmer_state_model.dart';
import '../../model/movie/movie.dart';
import '../../services/movie/movies_services.dart';

part 'top_rated_store.g.dart';

class TopRatedStore = _TopRatedStoreBase with _$TopRatedStore;

abstract class _TopRatedStoreBase with Store {
  final _moviesServices = Modular.get<MoviesServices>();

  ShimmerState<List<Movie>> topRatedMovies = ShimmerState<List<Movie>>();

  void load() async {
    (await _moviesServices.getTopRatedMovies()).result(
      (data) => topRatedMovies.setData(data),
      (error) => topRatedMovies.setError(error),
    );
  }
}
