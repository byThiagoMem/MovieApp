import '../../../../core/model/result.dart';
import '../../model/crew/crew.dart';
import '../../model/movie/movie.dart';

abstract class MoviesRepository {
  Future<Result<List<Movie>>> getUpcomingMovies();
  Future<Result<List<Movie>>> getPopularMovies();
  Future<Result<List<Movie>>> getTopRatedMovies();
  Future<Result<List<Movie>>> getNowPlayingMovies();
  Future<Result<List<Crew>>> getCrewMovieById({required String id});
}
