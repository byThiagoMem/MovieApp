import '../../../../core/model/result.dart';
import '../../model/movie/movie.dart';
import '../../repositories/movie/movies_repository.dart';
import '../movies_services.dart';

class MoviesServicesImpl implements MoviesServices {
  final MoviesRepository _movieRepository;

  MoviesServicesImpl({
    required MoviesRepository movieRepository,
  }) : _movieRepository = movieRepository;

  @override
  Future<Result<List<Movie>>> getUpComingMovies() =>
      _movieRepository.getUpComingMovies();
}
