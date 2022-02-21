import '../../../../core/model/result.dart';
import '../../model/tv_show.dart';

abstract class TvShowService {
  Future<Result<List<TvShow>>> getAiringTodayTv();
  Future<Result<List<TvShow>>> getOnTheAirTv();
  Future<Result<List<TvShow>>> getPopularTv();
  Future<Result<List<TvShow>>> getTopRatedTv();
}
