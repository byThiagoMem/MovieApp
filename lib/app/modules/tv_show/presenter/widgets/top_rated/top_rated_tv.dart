import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/model/failure.dart';
import '../../../../../movie_design_system/commom/utils/utils.dart';
import '../../../../../movie_design_system/widgets/banner/custom_banner.dart';
import '../../../../../movie_design_system/widgets/error/error_widget.dart';
import '../../../../../movie_design_system/widgets/error/no_internet_connection.dart';
import '../../../../../movie_design_system/widgets/shimmer/shimmer_card.dart';
import 'top_rated_tv_store.dart';

class TopRatedTv extends StatefulWidget {
  final String title;
  const TopRatedTv({Key? key, this.title = 'Top Rated'}) : super(key: key);

  @override
  _TopRatedTvState createState() => _TopRatedTvState();
}

class _TopRatedTvState extends ModularState<TopRatedTv, TopRatedTvStore> {
  @override
  void initState() {
    store.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => store.topRatedTv.handleStateLoadable(
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
                          store.tvShowsList,
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
                        image: store.tvShowsList[index].posterPath,
                        onTap: () => Modular.to.pushNamed(
                          AppRoutes.overviewTvPage,
                          arguments: ScreenArguments(
                            screenData: ScreenData(
                              id: store.tvShowsList[index].id,
                              title: store.tvShowsList[index].title,
                              overview: store.tvShowsList[index].overview,
                              releaseDate: store.tvShowsList[index].releaseDate,
                              genreIds: store.tvShowsList[index].genreIds,
                              voteAverage: store.tvShowsList[index].voteAverage,
                              popularity: store.tvShowsList[index].popularity,
                              posterPath: store.tvShowsList[index].posterPath,
                              backdropPath:
                                  store.tvShowsList[index].backdropPath,
                              isMovie: false,
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
