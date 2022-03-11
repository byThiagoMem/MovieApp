import '../../../../core/model/result.dart';
import '../../model/crew/tv_show_crew.dart';
import '../../model/tv_show/tv_show.dart';

abstract class TvShowRepository {
  Future<Result<List<TvShow>>> getAiringTodayTv({required int page});
  Future<Result<List<TvShow>>> getOnTheAirTv({required int page});
  Future<Result<List<TvShow>>> getPopularTv({required int page});
  Future<Result<List<TvShow>>> getTopRatedTv({required int page});
  Future<Result<List<TvShowCrew>>> getCrewTvById({required String id});
}
