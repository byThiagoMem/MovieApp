import 'package:flutter_modular/flutter_modular.dart';
import 'presentation_Page.dart';
import 'presentation_store.dart';
import 'repositories/presentation_repository_impl.dart';
import 'services/presentation_service_impl.dart';

class PresentationModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PresentationStore()),
    Bind.lazySingleton((i) => PresentationRepositoryImpl(dio: i.get())),
    Bind.lazySingleton(
        (i) => PresentationServiceImpl(presentationRepository: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const PresentationPage()),
  ];
}
