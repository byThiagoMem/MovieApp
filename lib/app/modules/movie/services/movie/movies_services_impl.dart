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
  Future<Result<List<Movie>>> getUpcomingMovies({required int page}) =>
      _movieRepository.getUpcomingMovies(page: page);

  @override
  Future<Result<List<Movie>>> getPopularMovies({required int page}) =>
      _movieRepository.getPopularMovies(page: page);

  @override
  Future<Result<List<Movie>>> getTopRatedMovies({required int page}) =>
      _movieRepository.getTopRatedMovies(page: page);

  @override
  Future<Result<List<Movie>>> getNowPlayingMovies({required int page}) =>
      _movieRepository.getNowPlayingMovies(page: page);

  @override
  Future<Result<List<MovieCrew>>> getCrewMovieById(String id) =>
      _movieRepository.getCrewMovieById(id);
}
