import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../commom/styles/color_palettes.dart';
import '../../commom/utils/sizes.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorPalettes.grey,
      highlightColor: ColorPalettes.white,
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(height: 10, width: 100, color: ColorPalettes.greyBg),
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: Sizes.dp15(context),
                ),
              )
            ],
          ),
          SizedBox(
            height: Sizes.height(context) * 0.23,
            child: ListView.separated(
              itemBuilder: (_, index) {
                return Container(
                  width: Sizes.width(context) * .33,
                  decoration: BoxDecoration(
                    color: ColorPalettes.greyBg,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        Sizes.dp10(context),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemCount: 5,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
