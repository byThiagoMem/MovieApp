import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/model/failure.dart';
import '../../../../../movie_design_system/commom/utils/utils.dart';
import '../../../../../movie_design_system/widgets/banner/custom_banner.dart';
import '../../../../../movie_design_system/widgets/error/error_widget.dart';
import '../../../../../movie_design_system/widgets/error/no_internet_connection.dart';
import '../../../../../movie_design_system/widgets/shimmer/shimmer_card.dart';
import 'popular_movies_store.dart';

class PopularMovies extends StatefulWidget {
  final String? title;
  const PopularMovies({Key? key, this.title = 'Popular Movies'})
      : super(key: key);

  @override
  State<PopularMovies> createState() => _PopularMoviesState();
}

class _PopularMoviesState
    extends ModularState<PopularMovies, PopularMoviesStore> {
  @override
  void initState() {
    store.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => store.popularMovies.handleStateLoadable(
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
                      'Popular',
                      style: TextStyle(
                        fontSize: Sizes.dp15(context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Modular.to.pushNamed(
                        AppRoutes.discover,
                        arguments: [
                          store.movies,
                          widget.title,
                          store.load,
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
                        image: store.movies[index].posterPath,
                        onTap: () => Modular.to.pushNamed(
                          AppRoutes.overviewMoviePage,
                          arguments: ScreenArguments(
                            screenData: ScreenData(
                              id: store.movies[index].id,
                              title: store.movies[index].title,
                              overview: store.movies[index].overview,
                              releaseDate: store.movies[index].releaseDate,
                              genreIds: store.movies[index].genreIds,
                              voteAverage: store.movies[index].voteAverage,
                              popularity: store.movies[index].popularity,
                              posterPath: store.movies[index].posterPath,
                              backdropPath: store.movies[index].backdropPath,
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
              onPressed: () => store.load(),
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
