import '../../../../core/model/result.dart';
import '../../model/crew/movie_crew.dart';
import '../../model/movie/movie.dart';
import '../../repositories/movie/movies_repository.dart';
import 'movies_services.dart';

class MoviesServicesImpl implements MoviesServices {
  final MoviesRepository _movieRepository;

  MoviesServicesImpl({
    required MoviesRepository movieRepository,
  }) : _movieRepository = movieRepository;

  @override
  Future<Result<List<Movie>>> getUpcomingMovies() =>
      _movieRepository.getUpcomingMovies();

  @override
  Future<Result<List<Movie>>> getPopularMovies() =>
      _movieRepository.getPopularMovies();

  @override
  Future<Result<List<Movie>>> getTopRatedMovies() =>
      _movieRepository.getTopRatedMovies();

  @override
  Future<Result<List<Movie>>> getNowPlayingMovies() =>
      _movieRepository.getNowPlayingMovies();

  @override
  Future<Result<List<MovieCrew>>> getCrewMovieById({required String id}) =>
      _movieRepository.getCrewMovieById(id: id);
}
