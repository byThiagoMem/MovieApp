import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/page/overview_tv_show_page.dart';
import 'presenter/widgets/crew/crew_tv_show_store.dart';

class OverviewTvShowModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CrewTvShowStore()),
  ];

  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => OverviewTvShowPage(data: args.data)),
  ];
}
