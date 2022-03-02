import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../movie_design_system/commom/extension/extension.dart';
import '../../movie_design_system/commom/utils/utils.dart';
import '../../movie_design_system/widgets/card/card_discover.dart';

class DiscoverPage extends StatefulWidget {
  final String isFrom;
  final List<ScreenData> data;
  const DiscoverPage({Key? key, required this.data, required this.isFrom}) : super(key: key);
  @override
  DiscoverPageState createState() => DiscoverPageState();
}

class DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          (widget.isFrom).replaceTitle,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {
          return CardDiscover(
            data: widget.data[index],
            onTap: () {
              widget.data[index].isMovie
                  ? Modular.to.pushNamed(
                      AppRoutes.overviewMoviePage,
                      arguments: ScreenArguments(screenData: widget.data[index]),
                    )
                  : Modular.to.pushNamed(
                      AppRoutes.overviewTvPage,
                      arguments: ScreenArguments(screenData: widget.data[index]),
                    );
            },
          );
        },
        padding: EdgeInsets.symmetric(horizontal: Sizes.dp10(context)),
        itemCount: widget.data.length,
      ),
    );
  }
}
