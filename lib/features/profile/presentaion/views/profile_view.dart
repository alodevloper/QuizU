import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_okoul/core/core.dart';

import '../../../scores/presentaion/widgets/score_card.dart';
import '../../providers/profile_provider.dart';
import '../widgets/empty_list.dart';
import '../widgets/user_data_widget.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileProvider);

    return SizedBox(
        width: context.screenSize.width,
        child: profileAsync.when(
          data: (userInfo) => Column(
            children: [
              UserDataWidget(userData: userInfo),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Previous Scores",
                  style: context.textTheme.titleMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(color: Colors.white.withOpacity(0.5)),
              Expanded(
                child: userInfo.userScores!.isEmpty
                    ? const EmptyList()
                    : ListView.builder(
                        itemCount: userInfo.userScores!.length,
                        itemBuilder: (_, index) => ScoreCard(
                            score: userInfo.userScores![index].score.toString(),
                            title: CustomDateFormatter.userScoreDateFormatter(
                                userInfo.userScores![index].time)),
                      ),
              )
            ],
          ),
          error: (_, e) => CustomErrorWidget(
              color: Colors.white,
              onTryAgin: () {
                ref.refresh(profileProvider);
              }),
          loading: () => const LoadingWidget(color: Colors.white),
        ));
  }
}
