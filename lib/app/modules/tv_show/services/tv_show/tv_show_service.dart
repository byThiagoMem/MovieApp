import '../../../../core/model/result.dart';
import '../../model/crew/tv_show_crew.dart';
import '../../model/tv_show/tv_show.dart';

abstract class TvShowService {
  Future<Result<List<TvShow>>> getAiringTodayTv();
  Future<Result<List<TvShow>>> getOnTheAirTv();
  Future<Result<List<TvShow>>> getPopularTv();
  Future<Result<List<TvShow>>> getTopRatedTv();
  Future<Result<List<TvShowCrew>>> getCrewTvById({required String id});
}
