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
    Future.delayed(const Duration(milliseconds: 2300))
        .then((_) => Modular.to.navigate(AppRoutes.dashboard));
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            ImagesAssets.background,
            fit: BoxFit.fill,
          ),
          Container(
            color: ColorPalettes.darkBG.withOpacity(.8),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImagesAssets.logo,
                width: Sizes.width(context) * .5,
              ),
              Builder(
                builder: (context) {
                  return AnimatedBuilder(
                    animation: _controller,
                    builder: (_, __) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: SizedBox(
                          width: Sizes.width(context) * .45,
                          child: LinearProgressIndicator(
                            backgroundColor: ColorPalettes.white,
                            value: _controller.value,
                            color: ColorPalettes.getColorCircleProgress(
                              _controller.value * 10,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
