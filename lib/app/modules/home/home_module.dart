import 'package:flutter_modular/flutter_modular.dart';

import '../home/home_store.dart';
import 'home_page.dart';
import 'repositories/movie/movies_repository_impl.dart';
import 'services/movie/movies_services_impl.dart';
import 'widgets/movie_banner/movie_banner_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => MovieBannerStore()),
    Bind.lazySingleton((i) => MoviesRepositoryImpl(dio: i.get())),
    Bind.lazySingleton((i) => MoviesServicesImpl(movieRepository: i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
  ];
}
