// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'movie_page.dart';
import 'repositories/movie/movies_repository_impl.dart';
import 'services/movie/movies_services_impl.dart';
import 'widgets/movie_banner/movie_banner_store.dart';
import 'widgets/popular/popular_store.dart';
import 'widgets/top_rated/top_rated_store.dart';
import 'widgets/upcoming/upcoming_store.dart';

class MovieModule extends WidgetModule {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MovieBannerStore()),
    Bind.lazySingleton((i) => PopularStore()),
    Bind.lazySingleton((i) => UpcomingStore()),
    Bind.lazySingleton((i) => TopRatedStore()),
    Bind.lazySingleton((i) => MoviesRepositoryImpl(dio: i.get())),
    Bind.lazySingleton((i) => MoviesServicesImpl(movieRepository: i.get())),
  ];

  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const MoviePage()),
  ];

  @override
  Widget get view => const MoviePage();
}
