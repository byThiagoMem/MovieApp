import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../commom/extension/extension.dart';
import '../../commom/styles/color_palettes.dart';
import '../../commom/utils/sizes.dart';
import '../error/error_image.dart';
import '../progress/loading_indicator.dart';

class CrewCard extends StatelessWidget {
  final String name;
  final String image;
  const CrewCard({Key? key, required this.name, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Sizes.width(context) * 0.25,
      child: GridTile(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: image.originalImage,
            width: Sizes.width(context) / 4.4,
            fit: BoxFit.cover,
            placeholder: (context, url) => const LoadingIndicator(),
            errorWidget: (context, url, error) => const ErrorImage(),
          ),
        ),
        footer: Container(
          alignment: Alignment.center,
          height: Sizes.dp22(context),
          decoration: BoxDecoration(
            color: ColorPalettes.whiteSemiTransparent,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(10),
            ),
          ),
          child: Text(
            name,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: ColorPalettes.darkBG,
              fontWeight: FontWeight.bold,
              fontSize: Sizes.dp12(context),
            ),
          ),
        ),
      ),
    );
  }
}
