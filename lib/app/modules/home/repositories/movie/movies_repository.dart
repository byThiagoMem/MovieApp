import '../../../../core/model/result.dart';
import '../../model/movie/movie.dart';

abstract class MoviesRepository {
  Future<Result<List<Movie>>> getUpComingMovies();
}
