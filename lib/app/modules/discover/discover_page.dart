import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../movie_design_system/commom/styles/color_palettes.dart';
import '../../movie_design_system/commom/utils/utils.dart';
import '../../movie_design_system/widgets/card/card_discover.dart';
import 'discover_store.dart';

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

class DiscoverPageState extends ModularState<DiscoverPage, DiscoverStore> {
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
      store.toggleLoading();
      widget.loadMoreData();
      Future.delayed(const Duration(seconds: 1))
          .then((_) => store.toggleLoading());
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
      body: Observer(
        builder: (_) {
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
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Observer(
        builder: (_) {
          return store.isLoading
              ? FloatingActionButton(
                  onPressed: null,
                  mini: true,
                  backgroundColor: ColorPalettes.darkBG,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(
                      color: ColorPalettes.darkAccent,
                      strokeWidth: 2,
                    ),
                  ),
                )
              : const SizedBox();
        },
      ),
    );
  }
}
