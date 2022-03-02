import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../commom/styles/color_palettes.dart';
import '../../commom/utils/app_constants.dart';
import '../../commom/utils/arguments.dart';
import '../../commom/utils/sizes.dart';
import '../error/error_image.dart';
import '../progress/loading_indicator.dart';

class BannerHome extends StatelessWidget {
  final List<ScreenData> data;
  final int currentIndex;
  final Function(int index, CarouselPageChangedReason reason) onPageChanged;
  final String title;
  final String routeNameDetail;
  final String routeNameAll;

  const BannerHome({
    Key? key,
    required this.data,
    required this.currentIndex,
    required this.onPageChanged,
    required this.routeNameDetail,
    required this.routeNameAll,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _itemCount = data.length > 9 ? 10 : data.length;
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: _itemCount,
          options: CarouselOptions(
            height: Sizes.width(context) / 2,
            enlargeCenterPage: true,
            viewportFraction: 1.0,
            enableInfiniteScroll: false,
            autoPlay: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayInterval: const Duration(seconds: 4),
            onPageChanged: onPageChanged,
          ),
          itemBuilder: (context, index, _) {
            return GestureDetector(
              onTap: () => Modular.to.pushNamed(
                routeNameDetail,
                arguments: ScreenArguments(
                  screenData: data[index],
                ),
              ),
              child: GridTile(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: AppConstants.urlImage + data[index].backdropPath,
                    placeholder: (_, __) => const LoadingIndicator(),
                    errorWidget: (_, __, ___) => const ErrorImage(),
                    fit: BoxFit.fill,
                    width: Sizes.width(context),
                  ),
                ),
                footer: Container(
                  decoration: BoxDecoration(
                    color: ColorPalettes.whiteSemiTransparent,
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                  ),
                  padding: EdgeInsets.all(Sizes.dp5(context)),
                  child: Text(
                    data[index].title.isNotEmpty ? data[index].title : 'No Tv Name',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: ColorPalettes.darkBG,
                      fontWeight: FontWeight.bold,
                      fontSize: Sizes.dp16(context),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    _itemCount,
                    (index) => Container(
                      width: Sizes.dp8(context),
                      height: Sizes.dp8(context),
                      margin: EdgeInsets.symmetric(
                        vertical: Sizes.dp10(context),
                        horizontal: 2.0,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentIndex == index ? ColorPalettes.darkAccent : ColorPalettes.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Modular.to.pushNamed('$routeNameAll/$title', arguments: data);
              },
              child: Text(
                'See all',
                style: TextStyle(
                  fontSize: Sizes.dp15(context),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
