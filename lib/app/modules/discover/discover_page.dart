import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../movie_design_system/commom/utils/utils.dart';
import '../../movie_design_system/widgets/card/card_discover.dart';

class DiscoverPage extends StatefulWidget {
  final String isFrom;
  final ObservableList<ScreenData> data;
  final VoidCallback loadMoreData;

  const DiscoverPage({
    Key? key,
    required this.data,
    required this.isFrom,
    required this.loadMoreData,
  }) : super(key: key);
  @override
  DiscoverPageState createState() => DiscoverPageState();
}

class DiscoverPageState extends State<DiscoverPage> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener((infinitiScrolling));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void infinitiScrolling() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      widget.loadMoreData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isFrom,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Observer(builder: (_) {
        return ListView.builder(
          controller: _scrollController,
          itemBuilder: (_, index) {
            return CardDiscover(
              data: widget.data[index],
              onTap: () {
                widget.data[index].isMovie
                    ? Modular.to.pushNamed(
                        AppRoutes.overviewMoviePage,
                        arguments:
                            ScreenArguments(screenData: widget.data[index]),
                      )
                    : Modular.to.pushNamed(
                        AppRoutes.overviewTvPage,
                        arguments:
                            ScreenArguments(screenData: widget.data[index]),
                      );
              },
            );
          },
          padding: EdgeInsets.symmetric(horizontal: Sizes.dp10(context)),
          itemCount: widget.data.length,
        );
      }),
    );
  }
}
