import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

import '../../../core/model/genres.dart';
import '../../commom/styles/color_palettes.dart';
import '../../commom/utils/utils.dart';
import '../error/error_image.dart';
import '../progress/loading_indicator.dart';
import 'genre_chip.dart';

class CardPresentation extends StatelessWidget {
  final String title;
  final String image;
  final List<int> genres;
  final double voteAverage;
  const CardPresentation(
      {Key? key,
      required this.title,
      required this.image,
      required this.genres,
      required this.voteAverage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: Sizes.height(context) * .28,
          width: Sizes.width(context) * .4,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.dp15(context)),
            child: CachedNetworkImage(
              imageUrl: AppConstants.urlImage + image,
              width: Sizes.width(context),
              height: Sizes.height(context),
              fit: BoxFit.fill,
              placeholder: (context, url) => const LoadingIndicator(),
              errorWidget: (context, url, error) => const ErrorImage(),
            ),
          ),
        ),
        Text(title),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:
                genres.map((e) => GenreTile(title: Genres.genres[e]!)).toList(),
          ),
        ),
        Text(voteAverage.toString()),
        RatingStars(
          valueLabelVisibility: false,
          maxValue: 10,
          starColor: ColorPalettes.yellow,
          value: voteAverage,
          starOffColor: ColorPalettes.grey,
          starSize: 14,
        ),
      ],
    );
  }
}
