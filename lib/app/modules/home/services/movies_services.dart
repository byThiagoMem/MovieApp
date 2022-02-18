import '../../../core/model/result.dart';
import '../model/movie/movie.dart';

abstract class MoviesServices {
  Future<Result<List<Movie>>> getUpComingMovies();
}
