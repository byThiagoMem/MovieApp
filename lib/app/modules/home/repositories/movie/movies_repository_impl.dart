import 'package:dio/dio.dart';

import '../../model/movie/movie.dart';
import 'movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final Dio _dio;

  MoviesRepositoryImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<Movie>> getMovieUpComming() async {
    var response = await _dio.get('movie/upcoming');

    print(response);
    return response.data;
  }
}
