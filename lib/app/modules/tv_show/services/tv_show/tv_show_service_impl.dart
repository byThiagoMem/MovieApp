import '../../../../core/model/result.dart';
import '../../model/crew/tv_show_crew.dart';
import '../../model/tv_show/tv_show.dart';
import '../../repositories/tv_show/tv_show_repository.dart';
import 'tv_show_service.dart';

class TvShowServiceImpl implements TvShowService {
  final TvShowRepository _tvShowRepository;

  TvShowServiceImpl({
    required TvShowRepository tvShowRepository,
  }) : _tvShowRepository = tvShowRepository;

  @override
  Future<Result<List<TvShow>>> getAiringTodayTv({required int page}) =>
      _tvShowRepository.getAiringTodayTv(page: page);

  @override
  Future<Result<List<TvShow>>> getOnTheAirTv({required int page}) =>
      _tvShowRepository.getOnTheAirTv(page: page);

  @override
  Future<Result<List<TvShow>>> getPopularTv({required int page}) =>
      _tvShowRepository.getPopularTv(page: page);

  @override
  Future<Result<List<TvShow>>> getTopRatedTv({required int page}) =>
      _tvShowRepository.getTopRatedTv(page: page);

  @override
  Future<Result<List<TvShowCrew>>> getCrewTvById({required String id}) =>
      _tvShowRepository.getCrewTvById(id: id);
}
