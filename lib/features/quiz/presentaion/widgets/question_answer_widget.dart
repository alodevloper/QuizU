import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './questions_counter.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../data/models/question_model.dart';
import '../../providers/question_state_provider.dart';
import 'option_item_card.dart';
import 'skip_button.dart';

class QuestionAnswersWidget extends ConsumerWidget {
  const QuestionAnswersWidget({
    Key? key,
    required this.questions,
  }) : super(key: key);

  final List<QuestionModel> questions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentQuestionIndex = ref.watch(questionsStateProvider);

    return Column(
      children: [
        QuestionsCounter(currentQuestionIndex: currentQuestionIndex),
        Text(
          questions[currentQuestionIndex].question,
          textAlign: TextAlign.center,
          style: context.textTheme.headline6!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        OptionItem(title: questions[currentQuestionIndex].a, value: "a"),
        OptionItem(title: questions[currentQuestionIndex].b, value: "b"),
        OptionItem(title: questions[currentQuestionIndex].c, value: "c"),
        OptionItem(title: questions[currentQuestionIndex].d, value: "d"),
        SkipButton(
            onTap: () =>
                ref.read(questionsStateProvider.notifier).skipQuestion())
      ],
    );
  }
}
