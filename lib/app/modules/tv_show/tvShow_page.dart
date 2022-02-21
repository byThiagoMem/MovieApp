import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'tvShow_store.dart';

class TvShowPage extends StatefulWidget {
  final String title;
  const TvShowPage({Key? key, this.title = 'TvShowPage'}) : super(key: key);
  @override
  TvShowPageState createState() => TvShowPageState();
}

class TvShowPageState extends State<TvShowPage> {
  final TvShowStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tv Show'),
      ),
    );
  }
}
