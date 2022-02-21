import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/model/failure.dart';
import '../../../../movie_design_system/commom/utils/app_constants.dart';
import '../../../../movie_design_system/widgets/banner/banner_home.dart';
import '../../../../movie_design_system/widgets/error/error_widget.dart';
import '../../../../movie_design_system/widgets/error/no_internet_connection.dart';
import '../../../../movie_design_system/widgets/shimmer/shimmer_banner.dart';
import 'tv_show_banner_store.dart';

class TvShowBanner extends StatefulWidget {
  const TvShowBanner({Key? key}) : super(key: key);

  @override
  _TvShowBannerState createState() => _TvShowBannerState();
}

class _TvShowBannerState extends State<TvShowBanner> {
  final _store = Modular.get<TvShowBannerStore>();

  @override
  void initState() {
    super.initState();
    _store.load();
  }

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    return Observer(
      builder: (_) => _store.aringTodayTvShows.handleStateLoadable(
        () {
          return const Center(child: ShimmerBanner());
        },
        (data, loading) {
          if (loading) {
            return const Center(child: ShimmerBanner());
          }
          return StatefulBuilder(
            key: const ValueKey('NothingFound 2'),
            builder: (_, setState) => BannerHome(
              data: _store.aringTodayTvShowsList,
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
