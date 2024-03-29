import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/model/failure.dart';
import '../../../../../movie_design_system/commom/utils/utils.dart';
import '../../../../../movie_design_system/widgets/banner/banner_home.dart';
import '../../../../../movie_design_system/widgets/error/error_widget.dart';
import '../../../../../movie_design_system/widgets/error/no_internet_connection.dart';
import '../../../../../movie_design_system/widgets/shimmer/shimmer_banner.dart';
import 'movie_banner_store.dart';

class MovieBanner extends StatefulWidget {
  final String title;
  const MovieBanner({Key? key, this.title = 'Now Playing Movies'})
      : super(key: key);

  @override
  State<MovieBanner> createState() => _MovieBannerState();
}

class _MovieBannerState extends ModularState<MovieBanner, MovieBannerStore> {
  @override
  void initState() {
    super.initState();
    store.load();
  }

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;

    return Observer(
      builder: (_) => store.nowPlayingMovies.handleStateLoadable(
        () {
          return const Center(child: ShimmerBanner());
        },
        (data, loading) {
          if (loading) {
            return const Center(child: ShimmerBanner());
          }
          return StatefulBuilder(
            key: const ValueKey('NothingFound'),
            builder: (_, setState) => BannerHome(
              data: store.movies,
              currentIndex: _currentIndex,
              onPageChanged: (index, reason) => setState(
                () => _currentIndex = index,
              ),
              routeNameDetail: AppRoutes.overviewMoviePage,
              routeNameAll: AppRoutes.discover,
              title: widget.title,
              loadMoreData: store.load,
            ),
          );
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
