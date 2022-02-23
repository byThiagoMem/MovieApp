import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../movie_design_system/commom/utils/arguments.dart';
import '../../movie_design_system/commom/utils/sizes.dart';
import '../../movie_design_system/widgets/card/card_discover.dart';
import 'discover_store.dart';

class DiscoverPage extends StatefulWidget {
  final String isFrom;
  final List<ScreenData> data;
  const DiscoverPage({Key? key, required this.data, required this.isFrom})
      : super(key: key);
  @override
  DiscoverPageState createState() => DiscoverPageState();
}

class DiscoverPageState extends ModularState<DiscoverPage, DiscoverStore> {
  final DiscoverStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          (widget.isFrom).replaceAll('&', ' '),
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.dp10(context),
          vertical: Sizes.dp10(context),
        ),
        child: Column(
          children: widget.data.map((e) => CardDiscover(data: e)).toList(),
        ),
      ),
    );
  }
}
