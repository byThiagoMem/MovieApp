import 'package:dio/dio.dart';

import './presentation_repository.dart';
import '../../../core/model/result.dart';
import '../../../movie_design_system/commom/utils/future_extension.dart';
import '../model/presentation.dart';

class PresentationRepositoryImpl implements PresentationRepository {
  final Dio _dio;
  PresentationRepositoryImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Result<List<Presentation>>> getNowPlayingMovies() async {
    return await _dio.get('/movie/now_playing').fullResult((json) => Presentation.fromMapList(json));
  }
}
