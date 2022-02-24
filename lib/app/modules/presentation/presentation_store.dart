import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/model/shimmer_state_model.dart';
import 'model/presentation.dart';
import 'services/presentation_service.dart';

part 'presentation_store.g.dart';

class PresentationStore = _PresentationStoreBase with _$PresentationStore;

abstract class _PresentationStoreBase with Store {
  final _presentationService = Modular.get<PresentationService>();

  ShimmerState<List<Presentation>> nowPlayingMovies =
      ShimmerState<List<Presentation>>();

  Future<void> load() async {
    (await _presentationService.getNowPlayingMovies()).result(
      (data) => nowPlayingMovies.setData(data),
      (error) => nowPlayingMovies.setError(error),
    );
  }
}
