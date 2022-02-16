import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'movie_design_system/commom/styles/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
    ).modular();
  }
}
