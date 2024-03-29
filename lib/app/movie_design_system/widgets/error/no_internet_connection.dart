import 'package:flutter/material.dart';

import '../../commom/utils/sizes.dart';

class NoInternetConnection extends StatelessWidget {
  final String message;
  final VoidCallback onPressed;
  const NoInternetConnection({
    Key? key,
    required this.message,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Sizes.dp12(context),
          ),
        ),
        SizedBox(height: Sizes.dp10(context)),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Sizes.dp10(context)),
            ),
          ),
          icon: const Icon(Icons.wifi),
          onPressed: onPressed,
          label: const Text('Reload'),
        ),
      ],
    );
  }
}
