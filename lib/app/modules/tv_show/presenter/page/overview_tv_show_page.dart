import 'package:flutter/material.dart';

import '../../../../movie_design_system/commom/utils/utils.dart';
import '../../../../movie_design_system/widgets/card/card_header.dart';
import '../widgets/crew/crew_tv_show.dart';

class OverviewTvShowPage extends StatefulWidget {
  final ScreenArguments data;
  const OverviewTvShowPage({Key? key, required this.data}) : super(key: key);
  @override
  OverviewTvShowPageState createState() => OverviewTvShowPageState();
}

class OverviewTvShowPageState extends State<OverviewTvShowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardHeader(data: widget.data),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.dp15(context),
                vertical: Sizes.dp15(context),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Story line',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: Sizes.dp16(context),
                    ),
                  ),
                  SizedBox(
                    height: Sizes.dp8(context),
                  ),
                  Text(
                    widget.data.screenData.overview,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.dp15(context),
              ),
              child: CrewTvShow(id: widget.data.screenData.id.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
