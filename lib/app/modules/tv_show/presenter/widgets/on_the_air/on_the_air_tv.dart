import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/model/failure.dart';
import '../../../../../movie_design_system/commom/utils/utils.dart';
import '../../../../../movie_design_system/widgets/banner/custom_banner.dart';
import '../../../../../movie_design_system/widgets/error/error_widget.dart';
import '../../../../../movie_design_system/widgets/error/no_internet_connection.dart';
import '../../../../../movie_design_system/widgets/shimmer/shimmer_card.dart';
import '../../../model/tv_show/tv_show.dart';
import 'on_the_air_tv_store.dart';

class OnTheAirTv extends StatefulWidget {
  final String title;
  const OnTheAirTv({Key? key, this.title = 'On&The&Air'}) : super(key: key);

  @override
  _OnTheAirTvState createState() => _OnTheAirTvState();
}

class _OnTheAirTvState extends State<OnTheAirTv> {
  final _store = Modular.get<OnTheAirTvStore>();

  @override
  void initState() {
    _store.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => _store.onTheAirTv.handleStateLoadable(
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
                      'On The Air ',
                      style: TextStyle(
                        fontSize: Sizes.dp15(context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Modular.to.pushNamed(
                        '${AppRoutes.discover}/${widget.title}',
                        arguments: TvShow.fromListScreenData(movie: data),
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
                          AppRoutes.overviewTvPage,
                          arguments: ScreenArguments(
                            screenData: ScreenData(
                              id: data[index].id,
                              title: data[index].title,
                              overview: data[index].overview,
                              releaseDate: data[index].firstAirDate,
                              genreIds: data[index].genreIds,
                              voteAverage: data[index].voteAverage,
                              popularity: data[index].popularity,
                              posterPath: data[index].posterPath,
                              backdropPath: data[index].backdropPath,
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
