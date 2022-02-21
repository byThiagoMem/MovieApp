import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../movie_design_system/commom/utils/arguments.dart';
import '../../movie_design_system/commom/utils/sizes.dart';
import 'discover_store.dart';
import 'widgets/card/card_header.dart';
import 'widgets/overview/overview_widget.dart';

class DiscoverPage extends StatefulWidget {
  final ScreenArguments data;
  const DiscoverPage({Key? key, required this.data}) : super(key: key);
  @override
  DiscoverPageState createState() => DiscoverPageState();
}

class DiscoverPageState extends State<DiscoverPage> {
  final DiscoverStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardHeader(data: widget.data),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.dp15(context),
                vertical: Sizes.dp15(context),
              ),
              child: OverviewWidget(overview: widget.data.screenData.overview),
            ),
          ],
        ),
      ),
    );
  }
}
