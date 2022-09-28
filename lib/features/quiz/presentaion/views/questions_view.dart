import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/widgets/error_widgte.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../providers/question_state_provider.dart';
import '../../providers/questions_provider.dart';
import '../views/complete_quiz_view.dart';
import '../widgets/widgets.dart';

class QuestionsView extends ConsumerWidget {
  const QuestionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionsAsync = ref.watch(questionsProvider);

    return Scaffold(
      body: Container(
        width: context.screenSize.width,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: questionsAsync.when(
          data: (questions) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QuizTimer(onComplete: () {
                ref.read(questionsStateProvider.notifier).postUserScore();
                context.pushReplacment(const CompleteQuizView());
              }),
              QuestionAnswersWidget(questions: questions),
            ],
          ),
          error: (_, e) => CustomErrorWidget(onTryAgin: () {
            ref.refresh(questionsProvider);
          }),
          loading: () => const LoadingWidget(),
        ),
      ),
    );
  }
}
