import 'package:dio/dio.dart';

import '../../../../core/model/result.dart';
import '../../../../movie_design_system/commom/utils/future_extension.dart';
import '../../model/crew/tv_show_crew.dart';
import '../../model/tv_show/tv_show.dart';
import 'tv_show_repository.dart';

class TvShowRepositoryImpl implements TvShowRepository {
  final Dio _dio;

  TvShowRepositoryImpl({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<Result<List<TvShow>>> getAiringTodayTv() async {
    return await _dio
        .get('/tv/airing_today')
        .fullResult((json) => TvShow.fromMapList(json));
  }

  @override
  Future<Result<List<TvShow>>> getOnTheAirTv() async {
    return await _dio
        .get('/tv/on_the_air')
        .fullResult((json) => TvShow.fromMapList(json));
  }

  @override
  Future<Result<List<TvShow>>> getPopularTv() async {
    return await _dio
        .get('/tv/popular')
        .fullResult((json) => TvShow.fromMapList(json));
  }

  @override
  Future<Result<List<TvShow>>> getTopRatedTv() async {
    return await _dio
        .get('/tv/top_rated')
        .fullResult((json) => TvShow.fromMapList(json));
  }

  @override
  Future<Result<List<TvShowCrew>>> getCrewTvById({required String id}) async {
    return await _dio
        .get('tv/$id/credits')
        .fullResult((json) => TvShowCrew.fromMapList(json));
  }
}
