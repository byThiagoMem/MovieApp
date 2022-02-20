import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/model/failure.dart';
import '../../../../movie_design_system/commom/utils/app_constants.dart';
import '../../../../movie_design_system/widgets/banner/banner_home.dart';
import '../../../../movie_design_system/widgets/error/error_widget.dart';
import '../../../../movie_design_system/widgets/error/no_internet_connection.dart';
import '../../../../movie_design_system/widgets/shimmer/shimmer_banner.dart';
import 'movie_banner_store.dart';

class MovieBanner extends StatefulWidget {
  MovieBanner({Key? key}) : super(key: key);

  @override
  State<MovieBanner> createState() => _MovieBannerState();
}

class _MovieBannerState extends State<MovieBanner> {
  final store = Modular.get<MovieBannerStore>();

  @override
  void initState() {
    super.initState();
    store.getNowPlayingMovies();
  }

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    return Observer(
      builder: (_) => store.nowPlayingMovies.handleState(
        () {
          return const Center(child: ShimmerBanner());
        },
        (data) {
          return StatefulBuilder(
            key: const ValueKey('NothingFound'),
            builder: (_, setState) => BannerHome(
              data: store.movies,
              currentIndex: _currentIndex,
              onPageChanged: (index, reason) => setState(
                () => _currentIndex = index,
              ),
            ),
          );
        },
        (error) {
          if (error is DioFailure) {
            return NoInternetConnection(
              message: AppConstants.noInternetConnection,
              onPressed: () => store.getNowPlayingMovies(),
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
