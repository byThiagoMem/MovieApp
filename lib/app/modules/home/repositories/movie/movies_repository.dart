import '../../model/movie/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getMovieUpComming();
}
