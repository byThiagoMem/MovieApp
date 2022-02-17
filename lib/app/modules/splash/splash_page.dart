import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../movie_design_system/commom/utils/images_assets.dart';
import 'splash_store.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key? key, this.title = 'SplashPage'}) : super(key: key);
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  final SplashStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagesAssets.background),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
