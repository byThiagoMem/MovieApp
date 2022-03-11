import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/model/genres.dart';
import '../../commom/styles/color_palettes.dart';
import '../../commom/utils/app_constants.dart';
import '../../commom/utils/arguments.dart';
import '../../commom/utils/sizes.dart';
import '../error/error_image.dart';
import '../progress/circular_vote_average.dart';
import '../progress/loading_indicator.dart';
import 'genre_chip.dart';

class CardDiscover extends StatelessWidget {
  final ScreenData data;
  final VoidCallback onTap;
  const CardDiscover({Key? key, required this.data, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Sizes.height(context) / 4.5,
        width: Sizes.width(context),
        margin: EdgeInsets.symmetric(vertical: Sizes.dp10(context)),
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: ColorPalettes.darkgrey,
          borderRadius: BorderRadius.circular(Sizes.dp10(context)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                child: CachedNetworkImage(
                  imageUrl: AppConstants.urlImage + data.posterPath,
                  placeholder: (_, __) => const LoadingIndicator(),
                  errorWidget: (_, __, ___) => const ErrorImage(),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(Sizes.dp7(context)),
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            CircularVoteAverage(voteAverage: data.voteAverage),
                            SizedBox(width: Sizes.dp5(context)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  data.releaseDate,
                                  style: const TextStyle(fontSize: 11),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Sizes.dp7(context)),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: data.genreIds
                              .map((e) => GenreTile(title: Genres.genres[e]!))
                              .toList(),
                        ),
                      ),
                      SizedBox(height: Sizes.dp4(context)),
                      Container(
                        child: Text(
                          data.overview,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
