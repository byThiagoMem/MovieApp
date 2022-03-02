import './presentation_service.dart';
import '../../../core/model/result.dart';
import '../model/presentation.dart';
import '../repositories/presentation_repository.dart';

class PresentationServiceImpl implements PresentationService {
  final PresentationRepository _presentationRepository;

  PresentationServiceImpl({
    required PresentationRepository presentationRepository,
  }) : _presentationRepository = presentationRepository;

  @override
  Future<Result<List<Presentation>>> getNowPlayingMovies() =>
      _presentationRepository.getNowPlayingMovies();
}
