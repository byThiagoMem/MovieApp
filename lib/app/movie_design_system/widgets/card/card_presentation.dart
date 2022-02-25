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
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            top: Sizes.dp30(context),
            right: Sizes.dp30(context),
            child: Text.rich(
              TextSpan(
                text: (index + 1).toString(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: '/${length.toString()}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: Sizes.height(context) * .3,
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
              SizedBox(height: Sizes.dp10(context)),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Sizes.dp10(context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: genres
                    .map((e) => GenreTile(title: Genres.genres[e]!))
                    .toList(),
              ),
              SizedBox(height: Sizes.dp10(context)),
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
          ),
        ],
      ),
    );
  }
}
