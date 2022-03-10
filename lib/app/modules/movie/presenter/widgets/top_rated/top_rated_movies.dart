import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/model/failure.dart';
import '../../../../../movie_design_system/commom/utils/app_constants.dart';
import '../../../../../movie_design_system/commom/utils/app_routes.dart';
import '../../../../../movie_design_system/commom/utils/arguments.dart';
import '../../../../../movie_design_system/commom/utils/sizes.dart';
import '../../../../../movie_design_system/widgets/banner/custom_banner.dart';
import '../../../../../movie_design_system/widgets/error/error_widget.dart';
import '../../../../../movie_design_system/widgets/error/no_internet_connection.dart';
import '../../../../../movie_design_system/widgets/shimmer/shimmer_card.dart';
import '../../../model/movie/movie.dart';
import 'top_rated_movies_store.dart';

class TopRatedMovies extends StatefulWidget {
  final String? title;
  const TopRatedMovies({Key? key, this.title = 'Top Rated Movies'})
      : super(key: key);

  @override
  _TopRatedMoviesState createState() => _TopRatedMoviesState();
}

class _TopRatedMoviesState extends State<TopRatedMovies> {
  final _store = Modular.get<TopRatedMoviesStore>();

  @override
  void initState() {
    super.initState();
    _store.load();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => _store.topRatedMovies.handleStateLoadable(
        () {
          return const Center(child: ShimmerCard());
        },
        (data, loading) {
          if (loading) {
            return const Center(child: ShimmerCard());
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Rated',
                      style: TextStyle(
                        fontSize: Sizes.dp15(context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Modular.to.pushNamed(
                        AppRoutes.discover,
                        arguments: [
                          Movie.fromListScreenData(movie: data),
                          widget.title
                        ],
                      ),
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: Sizes.dp15(context),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: Sizes.height(context) * 0.23,
                  child: ListView.separated(
                    itemBuilder: (_, index) {
                      return CustomBanner(
                        image: data[index].posterPath,
                        onTap: () => Modular.to.pushNamed(
                          AppRoutes.overviewMoviePage,
                          arguments: ScreenArguments(
                            screenData: ScreenData(
                              id: data[index].id,
                              title: data[index].title,
                              overview: data[index].overview,
                              releaseDate: data[index].releaseDate,
                              genreIds: data[index].genreIds,
                              voteAverage: data[index].voteAverage,
                              popularity: data[index].popularity,
                              posterPath: data[index].posterPath,
                              backdropPath: data[index].backdropPath,
                              isMovie: true,
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                    itemCount: data.length < 5 ? data.length : 6,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ],
            );
          }
        },
        (error) {
          if (error is DioFailure) {
            return NoInternetConnection(
              message: AppConstants.noInternetConnection,
              onPressed: () => _store.load(),
            );
          }
          if (error is DataFailure) {
            return CustomErrorWidget(
              message: AppConstants.failedToLoadData,
            );
          }
          return Center(
            child: Text(error.message),
          );
        },
      ),
    );
  }
}
