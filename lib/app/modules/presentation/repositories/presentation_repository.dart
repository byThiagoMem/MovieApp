import '../../../core/model/result.dart';
import '../model/presentation.dart';

// ignore: one_member_abstracts
abstract class PresentationRepository {
  Future<Result<List<Presentation>>> getNowPlayingMovies();
}
