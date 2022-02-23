import 'package:flutter/material.dart';

import '../../commom/styles/color_palettes.dart';

class CircularVoteAverage extends StatelessWidget {
  final double voteAverage;
  const CircularVoteAverage({Key? key, required this.voteAverage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = voteAverage >= 7.0
        ? ColorPalettes.green
        : voteAverage <= 7 && voteAverage > 5.0
            ? Colors.yellow
            : Colors.red;
    String percent = (voteAverage * 10).toStringAsFixed(0);

    return Container(
      width: 35,
      height: 35,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ColorPalettes.blueGrey,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 25,
            height: 25,
            child: CircularProgressIndicator(
              value: voteAverage / 10,
              color: color,
              strokeWidth: 3,
              backgroundColor: ColorPalettes.grey,
            ),
          ),
          Text(
            '$percent%',
            style: const TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
