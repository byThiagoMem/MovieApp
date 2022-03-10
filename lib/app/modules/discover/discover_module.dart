import 'package:flutter_modular/flutter_modular.dart';

import 'discover_page.dart';

class DiscoverModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => DiscoverPage(
        data: args.data[0],
        isFrom: args.data[1],
      ),
    ),
  ];
}
