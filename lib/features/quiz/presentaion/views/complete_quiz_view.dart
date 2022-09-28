import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/core.dart';
import '../../providers/question_state_provider.dart';

class CompleteQuizView extends ConsumerWidget {
  const CompleteQuizView({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final correctQuestions =
        ref.read(questionsStateProvider.notifier).correctAnswers;
    return Scaffold(
      body: Container(
        width: context.screenSize.width,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              winIcon,
              width: 150,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "You have complete  $correctQuestions  correct answers",
                style: context.theme.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
            QuizUButton(
              title: "Home",
              onPressed: () {
                context.pop();
              },
            ),
            const SizedBox(height: 10),
            correctQuestions != 0
                ? QuizUButton(
                    title: "Share",
                    onPressed: () {
                      shareUserScores(correctQuestions);
                    },
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  shareUserScores(int correctAnswers) {
    final String message =
        "I answered $correctAnswers correct answers in QuizU!";
    Share.share(message);
  }
}
