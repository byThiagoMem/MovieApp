import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../movie_design_system/commom/utils/utils.dart';
import '../widgets/movie_banner/movie_banner.dart';
import '../widgets/movie_banner/movie_banner_store.dart';
import '../widgets/popular/popular_movies.dart';
import '../widgets/popular/popular_movies_store.dart';
import '../widgets/top_rated/top_rated_movies.dart';
import '../widgets/top_rated/top_rated_movies_store.dart';
import '../widgets/upcoming/upcoming_movies.dart';
import '../widgets/upcoming/upcoming_movies_store.dart';

class MoviePage extends StatefulWidget {
  final String title;
  const MoviePage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  Future<void> _refresh() async {
    Future.wait([
      Modular.get<MovieBannerStore>().load(reload: true),
      Modular.get<PopularMoviesStore>().load(reload: true),
      Modular.get<UpcomingMoviesStore>().load(reload: true),
      Modular.get<TopRatedMoviesStore>().load(reload: true),
    ]).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        automaticallyImplyLeading: false,
      ),
      body: RefreshIndicator(
        onRefresh: () => _refresh(),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.all(10),
          children: [
            const MovieBanner(),
            SizedBox(height: Sizes.dp25(context)),
            const PopularMovies(),
            SizedBox(height: Sizes.dp25(context)),
            const UpcomingMovies(),
            SizedBox(height: Sizes.dp25(context)),
            const TopRatedMovies(),
            SizedBox(height: Sizes.dp25(context)),
          ],
        ),
      ),
    );
  }
}
