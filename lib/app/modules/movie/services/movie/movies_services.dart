import '../../../../core/model/result.dart';
import '../../model/crew/movie_crew.dart';
import '../../model/movie/movie.dart';

abstract class MoviesServices {
  Future<Result<List<Movie>>> getUpcomingMovies({required int page});
  Future<Result<List<Movie>>> getPopularMovies({required int page});
  Future<Result<List<Movie>>> getTopRatedMovies({required int page});
  Future<Result<List<Movie>>> getNowPlayingMovies({required int page});
  Future<Result<List<MovieCrew>>> getCrewMovieById(String id);
}
