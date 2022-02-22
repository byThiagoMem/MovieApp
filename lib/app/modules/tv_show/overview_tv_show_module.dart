import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/page/overview_tv_show_page.dart';

class OverviewTvShowModule extends Module {
  @override
  final List<Bind> binds = [];

  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => OverviewTvShowPage(data: args.data)),
  ];
}
