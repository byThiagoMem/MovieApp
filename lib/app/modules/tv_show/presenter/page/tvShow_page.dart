import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../movie_design_system/commom/utils/sizes.dart';
import '../widgets/on_the_air/on_the_air_tv.dart';
import '../widgets/popular/popular_tv.dart';
import '../widgets/top_rated/top_rated_tv.dart';
import '../widgets/tv_show_banner/tv_show_banner.dart';
import '../widgets/tv_show_banner/tv_show_banner_store.dart';

class TvShowPage extends StatefulWidget {
  final String title;
  const TvShowPage({Key? key, this.title = 'TvShowPage'}) : super(key: key);
  @override
  TvShowPageState createState() => TvShowPageState();
}

class TvShowPageState extends State<TvShowPage> {
  Future<void> _refresh() async {
    Future.wait([
      Modular.get<TvShowBannerStore>().load(reload: true),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tv Show',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        automaticallyImplyLeading: false,
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.all(10),
          children: [
            const TvShowBanner(),
            SizedBox(height: Sizes.dp25(context)),
            const OnTheAirTv(),
            SizedBox(height: Sizes.dp25(context)),
            const PopularTv(),
            SizedBox(height: Sizes.dp25(context)),
            const TopRatedTv(),
            SizedBox(height: Sizes.dp25(context)),
          ],
        ),
      ),
    );
  }
}
