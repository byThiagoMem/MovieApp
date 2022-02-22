import '../../../../core/model/result.dart';
import '../../model/crew/movie_crew.dart';
import '../../model/movie/movie.dart';

abstract class MoviesServices {
  Future<Result<List<Movie>>> getUpcomingMovies();
  Future<Result<List<Movie>>> getPopularMovies();
  Future<Result<List<Movie>>> getTopRatedMovies();
  Future<Result<List<Movie>>> getNowPlayingMovies();
  Future<Result<List<MovieCrew>>> getCrewMovieById({required String id});
}
