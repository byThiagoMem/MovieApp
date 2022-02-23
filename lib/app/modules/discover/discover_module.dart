import 'package:flutter_modular/flutter_modular.dart';

import 'discover_page.dart';
import 'discover_store.dart';

class DiscoverModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DiscoverStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/:isFrom',
      child: (_, args) => DiscoverPage(
        data: args.data,
        isFrom: args.params['isFrom'],
      ),
    ),
  ];
}
