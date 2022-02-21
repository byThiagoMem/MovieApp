import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../movie_design_system/commom/styles/color_palettes.dart';
import '../../movie_design_system/commom/utils/utils.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1999))
        .then((_) => Modular.to.navigate(AppRoutes.dashboard));
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            ImagesAssets.background,
            fit: BoxFit.fill,
          ),
          Builder(
            builder: (context) {
              return AnimatedBuilder(
                animation: _controller,
                builder: (_, __) {
                  return Center(
                    child: SizedBox(
                      height: 60,
                      width: 60,
                      child: CircularProgressIndicator(
                        value: _controller.value,
                        strokeWidth: 2,
                        color: ColorPalettes.getColorCircleProgress(
                          _controller.value * 10,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
