import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/model/shimmer_state_model.dart';
import '../../model/movie/movie.dart';
import '../../services/movie/movies_services.dart';

part 'popular_store.g.dart';

class PopularStore = _PopularStoreBase with _$PopularStore;

abstract class _PopularStoreBase with Store {
  final _moviesService = Modular.get<MoviesServices>();

  final ShimmerState<List<Movie>> popularMovies = ShimmerState<List<Movie>>();

  void load() async {
    (await _moviesService.getNowPlayingMovies()).result(
      (data) => popularMovies.setData(data),
      (error) => popularMovies.setError(error),
    );
  }
}
