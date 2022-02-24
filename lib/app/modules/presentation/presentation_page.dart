import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/model/failure.dart';
import '../../movie_design_system/commom/styles/color_palettes.dart';
import '../../movie_design_system/commom/utils/utils.dart';
import '../../movie_design_system/widgets/error/error.dart';
import '../../movie_design_system/widgets/shimmer/shimmer_card.dart';
import 'presentation_store.dart';

class PresentationPage extends StatefulWidget {
  final String title;
  const PresentationPage({Key? key, this.title = 'PresentationPage'})
      : super(key: key);
  @override
  PresentationPageState createState() => PresentationPageState();
}

class PresentationPageState
    extends ModularState<PresentationPage, PresentationStore> {
  @override
  void initState() {
    super.initState();
    store.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => store.nowPlayingMovies.handleStateLoadable(
          () {
            return const Center(child: ShimmerCard());
          },
          (data, loading) {
            if (loading) {
              return const Center(child: ShimmerCard());
            } else {
              return Stack(
                children: [],
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorPalettes.darkBN,
        onPressed: Modular.to.pop,
        child: Icon(
          Icons.arrow_back,
          color: ColorPalettes.darkAccent,
        ),
      ),
    );
  }
}
