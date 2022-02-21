import 'package:flutter_modular/flutter_modular.dart';

import 'core/network/dio_client.dart';
import 'modules/dashboard/dashboard_module.dart';
import 'modules/discover/discover_module.dart';
import 'modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DioClient().dio),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: SplashModule()),
    ModuleRoute('/dashboard', module: DashboardModule()),
    ModuleRoute('/discover', module: DiscoverModule()),
  ];
}
