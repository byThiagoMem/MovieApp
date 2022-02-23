import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

import '../../../core/model/genres.dart';
import '../../commom/extension/extension.dart';
import '../../commom/styles/color_palettes.dart';
import '../../commom/utils/app_constants.dart';
import '../../commom/utils/arguments.dart';
import '../../commom/utils/sizes.dart';
import '../error/error_image.dart';
import '../progress/loading_indicator.dart';
import 'genre_chip.dart';

class CardHeader extends StatelessWidget {
  final ScreenArguments data;
  const CardHeader({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.height(context) * .4,
      child: Stack(
        children: [
          //Image background
          SizedBox(
            height: Sizes.height(context) * .29,
            width: double.maxFinite,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(Sizes.width(context) * .35),
              ),
              child: Opacity(
                opacity: .6,
                child: CachedNetworkImage(
                  imageUrl: data.screenData.backdropPath.originalImage,
                  fit: BoxFit.fill,
                  placeholder: (context, url) => const LoadingIndicator(),
                  errorWidget: (context, url, error) => const ErrorImage(),
                ),
              ),
            ),
          ),
          //Back button
          Positioned(
            top: Sizes.height(context) * .06,
            child: IconButton(
              onPressed: Modular.to.pop,
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          //Favorite Icon
          Positioned(
            top: Sizes.height(context) * .06,
            right: 1,
            child: IconButton(
              onPressed: Modular.to.pop,
              icon: Icon(Icons.favorite_border_outlined,
                  color: ColorPalettes.yellow),
            ),
          ),
          // Card
          Positioned(
            height: Sizes.height(context) * .22,
            left: Sizes.width(context) * .03,
            bottom: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: AppConstants.urlImage + data.screenData.posterPath,
                placeholder: (context, url) => const LoadingIndicator(),
                errorWidget: (context, url, error) => const ErrorImage(),
              ),
            ),
          ),
          //Infos
          Positioned(
            height: Sizes.height(context) * .22,
            left: Sizes.width(context) * .35,
            right: 5,
            bottom: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: Sizes.dp15(context)),
                Text(
                  data.screenData.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: Sizes.dp10(context)),
                RatingStars(
                  maxValue: 10,
                  starColor: ColorPalettes.yellow,
                  value: data.screenData.voteAverage,
                  starOffColor: ColorPalettes.grey,
                  starSize: 14,
                ),
                SizedBox(height: Sizes.dp23(context)),
                SizedBox(
                  height: Sizes.dp30(context),
                  child: ListView.separated(
                    itemBuilder: (_, index) {
                      return GenreTile(
                        title: Genres.genres[data.screenData.genreIds[index]]
                            .toString(),
                      );
                    },
                    separatorBuilder: (_, __) => SizedBox(
                      width: Sizes.dp4(context),
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: data.screenData.genreIds.length,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
