// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'tvShow_page.dart';
import 'tvShow_store.dart';

class TvShowModule extends WidgetModule {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => TvShowStore()),
  ];

  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const TvShowPage()),
  ];

  @override
  Widget get view => const TvShowPage();
}
