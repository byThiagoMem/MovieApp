import 'package:dio/dio.dart';

import '../../../../core/model/result.dart';
import '../../../../movie_design_system/commom/utils/future_extension.dart';
import '../../model/movie/movie.dart';
import 'movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final Dio _dio;

  MoviesRepositoryImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Result<List<Movie>>> getUpComingMovies() async {
    return await _dio.get('/movie/upcoming').fullResult((json) =>
        List<Movie>.from(json['results'].map((e) => Movie.fromMap(e))));
  }
}
