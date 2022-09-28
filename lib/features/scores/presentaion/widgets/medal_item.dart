import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../data/models/leaderboard_model.dart';

class MedalItem extends StatelessWidget {
  const MedalItem({
    Key? key,
    required this.leaderboardModel,
    required this.image,
    this.isFirst = false,
  }) : super(key: key);
  final LeaderboardModel leaderboardModel;
  final String image;
  final bool isFirst;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        !isFirst ? const SizedBox(height: 30) : const SizedBox.shrink(),
        SvgPicture.asset(
          image,
          width: 60,
        ),
        RichText(
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
              style: context.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              text: "${leaderboardModel.score}\n",
              children: [
                TextSpan(
                  text: leaderboardModel.name,
                  style: context.textTheme.bodyMedium!
                      .copyWith(color: Colors.white.withOpacity(0.8)),
                )
              ]),
        )
      ],
    );
  }
}
