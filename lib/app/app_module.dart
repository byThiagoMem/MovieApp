import 'package:flutter_modular/flutter_modular.dart';

import 'core/network/dio_client.dart';
import 'modules/dashboard/dashboard_module.dart';
import 'modules/discover/discover_module.dart';
import 'modules/movie/overiew_movies_module.dart';
import 'modules/presentation/presentation_module.dart';
import 'modules/splash/splash_module.dart';
import 'modules/tv_show/overview_tv_show_module.dart';
import 'movie_design_system/commom/utils/app_routes.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DioClient().dio),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: SplashModule()),
    ModuleRoute(AppRoutes.dashboard, module: DashboardModule()),
    ModuleRoute(AppRoutes.overviewMoviePage, module: OverviewMoviesModule()),
    ModuleRoute(AppRoutes.overviewTvPage, module: OverviewTvShowModule()),
    ModuleRoute(AppRoutes.discover, module: DiscoverModule()),
    ModuleRoute(AppRoutes.presentation, module: PresentationModule()),
  ];
}
