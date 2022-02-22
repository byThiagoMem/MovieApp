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
  Future<Result<List<Movie>>> getUpcomingMovies() async {
    return await _dio
        .get('/movie/upcoming')
        .fullResult((json) => Movie.fromMapList(json));
  }

  @override
  Future<Result<List<Movie>>> getPopularMovies() async {
    return await _dio
        .get('/movie/popular')
        .fullResult((json) => Movie.fromMapList(json));
  }

  @override
  Future<Result<List<Movie>>> getTopRatedMovies() async {
    return await _dio
        .get('/movie/top_rated')
        .fullResult((json) => Movie.fromMapList(json));
  }

  @override
  Future<Result<List<Movie>>> getNowPlayingMovies() async {
    return await _dio
        .get('/movie/now_playing')
        .fullResult((json) => Movie.fromMapList(json));
  }

  @override
  Future<Result<List<MovieCrew>>> getCrewMovieById({required String id}) async {
    return await _dio
        .get('movie/$id/credits')
        .fullResult((json) => MovieCrew.fromMapList(json));
  }
}
