import 'package:flutter/material.dart';
import 'package:quiz_okoul/core/core.dart';

import '../../data/models/leaderboard_model.dart';
import 'medal_item.dart';

class TopThreeScores extends StatelessWidget {
  const TopThreeScores({
    Key? key,
    required this.topScoresList,
  }) : super(key: key);
  final List<LeaderboardModel> topScoresList;
  @override
  Widget build(BuildContext context) {
    return VerticalSlidingAnimation(
      duration: const Duration(seconds: 1),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: MedalItem(
                leaderboardModel: topScoresList[1],
                image: secondMedal,
              ),
            ),
            Expanded(
              child: MedalItem(
                leaderboardModel: topScoresList[0],
                image: firstMedal,
                isFirst: true,
              ),
            ),
            Expanded(
              child: MedalItem(
                leaderboardModel: topScoresList[2],
                image: thirdMedal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
