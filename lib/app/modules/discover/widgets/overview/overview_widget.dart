import 'package:flutter/material.dart';

import '../../../../movie_design_system/commom/utils/sizes.dart';

class OverviewWidget extends StatelessWidget {
  final String overview;
  const OverviewWidget({Key? key, required this.overview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Story line',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: Sizes.dp16(context),
          ),
        ),
        SizedBox(
          height: Sizes.dp8(context),
        ),
        Text(
          overview,
        ),
      ],
    );
  }
}
