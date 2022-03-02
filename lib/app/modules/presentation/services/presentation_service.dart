import '../../../core/model/result.dart';
import '../model/presentation.dart';

// ignore: one_member_abstracts
abstract class PresentationService {
  Future<Result<List<Presentation>>> getNowPlayingMovies();
}
