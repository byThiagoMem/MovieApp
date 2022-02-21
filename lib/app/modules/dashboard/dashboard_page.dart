import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../movie_design_system/commom/styles/color_palettes.dart';
import '../../movie_design_system/commom/utils/sizes.dart';
import '../movie/movie_module.dart';
import '../tv_show/tvShow_module.dart';
import 'dashboard_store.dart';

class DashboardPage extends StatefulWidget {
  final String title;
  const DashboardPage({Key? key, this.title = 'DashboardPage'})
      : super(key: key);
  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  final DashboardStore _store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _store.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          MovieModule(),
          TvShowModule(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.location_searching,
          color: ColorPalettes.white,
        ),
      ),
      bottomNavigationBar: Observer(
        builder: (_) {
          return BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: Sizes.dp6(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  tooltip: 'movie',
                  color: _store.currentPage == 0
                      ? ColorPalettes.darkAccent
                      : ColorPalettes.grey,
                  icon: const Icon(Icons.movie_creation),
                  onPressed: () => _store.setCurrentPage(0),
                ),
                IconButton(
                  tooltip: 'tv_show',
                  color: _store.currentPage == 1
                      ? ColorPalettes.darkAccent
                      : ColorPalettes.grey,
                  icon: const Icon(Icons.live_tv),
                  onPressed: () => _store.setCurrentPage(1),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
