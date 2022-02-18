import '../../../core/model/result.dart';
import '../model/movie/movie.dart';

abstract class MoviesServices {
  Future<Result<List<Movie>>> getUpcomingMovies();
  Future<Result<List<Movie>>> getPopularMovies();
  Future<Result<List<Movie>>> getTopRatedMovies();
}
