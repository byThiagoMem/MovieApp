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
  final int index;
  final int length;
  const CardPresentation({
    Key? key,
    required this.title,
    required this.image,
    required this.genres,
    required this.voteAverage,
    required this.index,
    required this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.dp20(context)),
          child: CachedNetworkImage(
            imageUrl: AppConstants.urlImage + image,
            width: Sizes.width(context) / 1.7,
            placeholder: (context, url) => const LoadingIndicator(),
            errorWidget: (context, url, error) => const ErrorImage(),
          ),
        ),
        SizedBox(
          height: Sizes.height(context) * .02,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: Sizes.width(context) / 14,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: Sizes.height(context) * .01,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                genres.map((e) => GenreTile(title: Genres.genres[e]!)).toList(),
          ),
        ),
        SizedBox(
          height: Sizes.height(context) * .01,
        ),
        SizedBox(
          height: Sizes.height(context) * .005,
        ),
        Text(
          voteAverage.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: Sizes.dp4(context)),
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
