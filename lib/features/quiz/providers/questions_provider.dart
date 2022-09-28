import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_okoul/features/quiz/data/models/question_model.dart';
import 'package:quiz_okoul/features/quiz/providers/question_state_provider.dart';

final questionsProvider = FutureProvider<List<QuestionModel>>((ref) async {
  return ref.read(questionsStateProvider.notifier).getQuizQuestions();
});
