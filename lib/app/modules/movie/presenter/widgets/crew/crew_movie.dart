import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/model/failure.dart';
import '../../../../../movie_design_system/commom/utils/utils.dart';
import '../../../../../movie_design_system/widgets/card/card_crew.dart';
import '../../../../../movie_design_system/widgets/error/error_widget.dart';
import '../../../../../movie_design_system/widgets/error/no_internet_connection.dart';
import '../../../../../movie_design_system/widgets/shimmer/shimmer_crew_card.dart';
import 'crew_movie_store.dart';

class CrewMovie extends StatefulWidget {
  final String id;
  const CrewMovie({Key? key, required this.id}) : super(key: key);

  @override
  _CrewMovieState createState() => _CrewMovieState();
}

class _CrewMovieState extends ModularState<CrewMovie, CrewMovieStore> {
  @override
  void initState() {
    super.initState();
    store.load(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => store.crew.handleStateLoadable(
        () {
          return const Center(child: ShimmerCrewCard());
        },
        (data, loading) {
          if (loading) {
            return const Center(child: ShimmerCrewCard());
          } else {
            return Visibility(
              visible: data.isNotEmpty,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Crew',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: Sizes.dp16(context),
                    ),
                  ),
                  SizedBox(height: Sizes.dp8(context)),
                  SizedBox(
                    height: Sizes.height(context) * 0.2,
                    child: ListView.separated(
                      itemBuilder: (_, index) {
                        return CardCrew(
                          name: data[index].name,
                          image: data[index].profilePath,
                        );
                      },
                      separatorBuilder: (_, __) => const SizedBox(width: 10),
                      itemCount: data.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ],
              ),
            );
          }
        },
        (error) {
          if (error is DioFailure) {
            return NoInternetConnection(
              message: AppConstants.noInternetConnection,
              onPressed: () => store.load(id: widget.id),
            );
          }
          if (error is DataFailure) {
            return CustomErrorWidget(
              message: AppConstants.failedToLoadData,
            );
          }
          return Center(
            child: Text(error.message),
          );
        },
      ),
    );
  }
}
