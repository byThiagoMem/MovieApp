import 'package:flutter/material.dart';

import '../../commom/styles/color_palettes.dart';
import '../../commom/utils/sizes.dart';

class GenreTile extends StatelessWidget {
  final String title;

  const GenreTile({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Sizes.dp5(context)),
      margin: EdgeInsets.only(right: Sizes.dp7(context)),
      decoration: BoxDecoration(
        border: Border.all(color: ColorPalettes.grey, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: ColorPalettes.white,
          fontSize: 12,
        ),
      ),
    );
  }
}
