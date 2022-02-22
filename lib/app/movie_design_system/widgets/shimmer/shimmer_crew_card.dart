import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../commom/styles/color_palettes.dart';
import '../../commom/utils/utils.dart';

class ShimmerCrewCard extends StatelessWidget {
  const ShimmerCrewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorPalettes.grey,
      highlightColor: ColorPalettes.white,
      child: SizedBox(
        height: Sizes.height(context) * 0.2,
        child: ListView.separated(
          itemBuilder: (_, __) {
            return Container(
              width: Sizes.width(context) * 0.25,
              decoration: BoxDecoration(
                color: ColorPalettes.greyBg,
                borderRadius: BorderRadius.circular(10),
              ),
            );
          },
          separatorBuilder: (_, __) => const SizedBox(width: 10),
          itemCount: 6,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
