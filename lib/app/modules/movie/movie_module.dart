// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/movie_page.dart';
import 'presenter/widgets/crew/crew_movie_store.dart';
import 'presenter/widgets/movie_banner/movie_banner_store.dart';
import 'presenter/widgets/popular/popular_movies_store.dart';
import 'presenter/widgets/top_rated/top_rated_movies_store.dart';
import 'presenter/widgets/upcoming/upcoming_movies_store.dart';
import 'repositories/movie/movies_repository_impl.dart';
import 'services/movie/movies_services_impl.dart';

class MovieModule extends WidgetModule {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MovieBannerStore()),
    Bind.lazySingleton((i) => PopularMoviesStore()),
    Bind.lazySingleton((i) => UpcomingMoviesStore()),
    Bind.lazySingleton((i) => TopRatedMoviesStore()),
    Bind.lazySingleton((i) => CrewMovieStore()),
    Bind.lazySingleton((i) => MoviesRepositoryImpl(dio: i.get())),
    Bind.lazySingleton((i) => MoviesServicesImpl(movieRepository: i.get())),
  ];

  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const MoviePage()),
  ];

  @override
  Widget get view => const MoviePage();
}
