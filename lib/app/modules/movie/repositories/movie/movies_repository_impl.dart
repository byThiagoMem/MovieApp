import 'package:dio/dio.dart';

import '../../../../core/model/result.dart';
import '../../../../movie_design_system/commom/utils/future_extension.dart';
import '../../model/crew/movie_crew.dart';
import '../../model/movie/movie.dart';
import 'movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final Dio _dio;

  MoviesRepositoryImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Result<List<Movie>>> getUpcomingMovies({required int page}) async {
    return await _dio.get('/movie/upcoming', queryParameters: {
      'page': page,
    }).fullResult((json) => Movie.fromMapList(json));
  }

  @override
  Future<Result<List<Movie>>> getPopularMovies({required int page}) async {
    return await _dio.get('/movie/popular', queryParameters: {
      'page': page,
    }).fullResult((json) => Movie.fromMapList(json));
  }

  @override
  Future<Result<List<Movie>>> getTopRatedMovies({required int page}) async {
    return await _dio.get('/movie/top_rated', queryParameters: {
      'page': page,
    }).fullResult((json) => Movie.fromMapList(json));
  }

  @override
  Future<Result<List<Movie>>> getNowPlayingMovies({required int page}) async {
    return await _dio.get('/movie/now_playing', queryParameters: {
      'page': page,
    }).fullResult((json) => Movie.fromMapList(json));
  }

  @override
  Future<Result<List<MovieCrew>>> getCrewMovieById(String id) async {
    return await _dio
        .get('movie/$id/credits')
        .fullResult((json) => MovieCrew.fromMapList(json));
  }
}
