import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/model/failure.dart';
import '../../movie_design_system/commom/styles/color_palettes.dart';
import '../../movie_design_system/commom/utils/utils.dart';
import '../../movie_design_system/widgets/card/card_presentation.dart';
import '../../movie_design_system/widgets/error/error.dart';
import '../../movie_design_system/widgets/progress/loading_indicator.dart';
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
              return PageView.builder(
                onPageChanged: (value) => store.setCurrentPage(value),
                controller: store.pageController,
                itemCount: data.length,
                itemBuilder: (constex, index) {
                  return Container(
                    height: Sizes.height(context),
                    width: Sizes.width(context),
                    child: Observer(builder: (_) {
                      return Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: AppConstants.urlImage +
                                data[store.currentPage].backdropPath,
                            width: Sizes.width(context),
                            height: Sizes.height(context),
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                const LoadingIndicator(),
                            errorWidget: (context, url, error) =>
                                const ErrorImage(),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    ColorPalettes.black.withOpacity(.9),
                                    ColorPalettes.black.withOpacity(.3),
                                    ColorPalettes.black.withOpacity(.95)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: [0.1, 0.5, 0.9]),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: CardPresentation(
                              title: data[store.currentPage].title,
                              image: data[store.currentPage].posterPath,
                              genres: data[store.currentPage].genreIds,
                              voteAverage: data[store.currentPage].voteAverage,
                              index: index,
                              length: data.length,
                            ),
                          )
                        ],
                      );
                    }),
                  );
                },
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
