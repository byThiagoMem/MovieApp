import 'package:flutter/material.dart';

import '../../commom/utils/sizes.dart';

class CustomErrorWidget extends StatelessWidget {
  final String? message;
  const CustomErrorWidget({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message ?? 'Unknown Error',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: Sizes.dp12(context),
        ),
      ),
    );
  }
}
