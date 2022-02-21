import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../commom/utils/app_constants.dart';
import '../../commom/utils/sizes.dart';
import '../error/error_image.dart';
import '../progress/loading_indicator.dart';

class CustomBanner extends StatelessWidget {
  final String image;
  final VoidCallback onTap;
  const CustomBanner({Key? key, required this.image, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: Sizes.width(context) / 3,
          child: Hero(
            tag: 'banner$image',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: AppConstants.baseUrlImage + image,
                fit: BoxFit.cover,
                placeholder: (context, url) => const LoadingIndicator(),
                errorWidget: (context, url, error) => const ErrorImage(),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            borderRadius: BorderRadius.circular(Sizes.dp10(context)),
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(Sizes.dp10(context)),
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }
}
