import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/extensions.dart';
import '../../../../core/widgets/error_widgte.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../providers/top_scores_provider.dart';
import '../widgets/score_card.dart';
import '../widgets/top_three_scores.dart';

class LeaderboardView extends ConsumerWidget {
  const LeaderboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topScoresAsync = ref.watch(topScoresProvider);

    return SizedBox(
        width: context.screenSize.width,
        child: topScoresAsync.when(
          data: (topScores) => Column(
            children: [
              const SizedBox(height: 20),
              TopThreeScores(topScoresList: topScores),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: topScores.length - 3,
                  itemBuilder: (_, index) {
                    final currentIndex = index + 3;
                    return ScoreCard(
                      title:
                          "${currentIndex + 1}.   ${topScores[currentIndex].name}",
                      score: topScores[currentIndex].score.toString(),
                    );
                  },
                ),
              )
            ],
          ),
          error: (_, e) => CustomErrorWidget(onTryAgin: () {
            ref.refresh(topScoresProvider);
          }),
          loading: () => const LoadingWidget(),
        ));
  }
}
