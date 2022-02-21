import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../movie_design_system/commom/utils/arguments.dart';
import 'discover_store.dart';

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
      appBar: AppBar(
        title: Text(widget.data.screenData.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
