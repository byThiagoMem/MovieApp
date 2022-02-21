// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'repositories/tv_show/tv_show_repository_impl.dart';
import 'services/tv_show/tv_show_service_impl.dart';
import 'tvShow_page.dart';
import 'widgets/on_the_air/on_the_air_tv_store.dart';
import 'widgets/popular/popular_tv_store.dart';
import 'widgets/top_rated/top_rated_tv_store.dart';
import 'widgets/tv_show_banner/tv_show_banner_store.dart';

class TvShowModule extends WidgetModule {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => TvShowBannerStore()),
    Bind.lazySingleton((i) => OnTheAirTvStore()),
    Bind.lazySingleton((i) => PopularTvStore()),
    Bind.lazySingleton((i) => TopRatedTvStore()),
    Bind.lazySingleton((i) => TvShowRepositoryImpl(dio: i.get())),
    Bind.lazySingleton((i) => TvShowServiceImpl(tvShowRepository: i.get())),
  ];

  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const TvShowPage()),
  ];

  @override
  Widget get view => const TvShowPage();
}
