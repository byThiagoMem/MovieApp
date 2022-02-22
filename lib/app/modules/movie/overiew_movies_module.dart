import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/overview_movie_page.dart';

class OverviewMoviesModule extends Module {
  @override
  final List<Bind> binds = [];

  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => OverviewMoviePage(data: args.data)),
  ];
}
