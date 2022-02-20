import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../movie_design_system/commom/utils/utils.dart';
import 'movie_store.dart';
import 'widgets/movie_banner/movie_banner.dart';
import 'widgets/popular/popular_movies.dart';
import 'widgets/top_rated/top_rated.dart';
import 'widgets/upcoming/upcoming_movies.dart';

class MoviePage extends StatefulWidget {
  final String title;
  const MoviePage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends ModularState<MoviePage, MovieStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.all(10),
        children: [
          const MovieBanner(),
          SizedBox(height: Sizes.dp25(context)),
          const PopularMovies(),
          SizedBox(height: Sizes.dp25(context)),
          const UpcomingMovies(),
          SizedBox(height: Sizes.dp25(context)),
          const TopRated(),
        ],
      ),
    );
  }
}
