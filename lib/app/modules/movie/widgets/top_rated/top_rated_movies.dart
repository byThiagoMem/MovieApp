import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/model/failure.dart';
import '../../../../movie_design_system/commom/utils/app_constants.dart';
import '../../../../movie_design_system/commom/utils/sizes.dart';
import '../../../../movie_design_system/widgets/banner/custom_banner.dart';
import '../../../../movie_design_system/widgets/error/error_widget.dart';
import '../../../../movie_design_system/widgets/error/no_internet_connection.dart';
import '../../../../movie_design_system/widgets/shimmer/shimmer_card.dart';
import 'top_rated_movies_store.dart';

class TopRatedMovies extends StatefulWidget {
  const TopRatedMovies({Key? key}) : super(key: key);

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
                      onPressed: () {},
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
                      );
                    },
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                    itemCount: data.length < 5 ? data.length : 5,
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
