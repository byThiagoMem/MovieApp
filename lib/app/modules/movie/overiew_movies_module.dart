import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/overview_movie_page.dart';
import 'presenter/widgets/crew/crew_movie_store.dart';

class OverviewMoviesModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CrewMovieStore()),
  ];

  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => OverviewMoviePage(data: args.data)),
  ];
}
