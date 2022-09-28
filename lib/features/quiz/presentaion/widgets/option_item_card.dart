import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/core.dart';
import '../../providers/question_state_provider.dart';
import '../views/complete_quiz_view.dart';
import '../views/wrong_answer_view.dart';

class OptionItem extends ConsumerWidget {
  const OptionItem({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        final status =
            ref.read(questionsStateProvider.notifier).nextQuestion(value);
        if (status != AnswerStatus.passed) {
          context.pushReplacment(status == AnswerStatus.fail
              ? const WrongAnswerView()
              : const CompleteQuizView());
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        width: context.screenSize.width,
        decoration: BoxDecoration(
            border: Border.all(color: primaryColor),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              margin: const EdgeInsetsDirectional.only(end: 10),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor,
              ),
              child: Text(
                value,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(
                title,
                style: context.textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
