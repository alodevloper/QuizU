import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/keys_enums.dart';
import '../../../core/utils/local_data_provider.dart';
import '../data/models/question_model.dart';
import '../data/models/user_score_model.dart';
import '../data/repositries/quiz_repo.dart';
import '../presentaion/widgets/skip_button.dart';

class QuetionsNotifier extends StateNotifier<int> {
  QuetionsNotifier(this.ref) : super(0);
  final Ref ref;
  late List<QuestionModel> questionsList;
  int correctAnswers = 0;
  Future<List<QuestionModel>> getQuizQuestions() async {
    final response = await ref.read(quizRepoProvider).getQuizQuestions();
    final data = List<QuestionModel>.from(
      response.map(
        // ignore: unnecessary_lambdas
        (item) => QuestionModel.fromJson(item),
      ),
    );
    questionsList = data;
    return questionsList;
  }

  saveUserScoreLocaly() async {
    final userScore =
        UserScoreModel(score: correctAnswers, time: DateTime.now().toString());
    final prefs = await ref.read(sharedPreferencesProvider.future);
    List<String> userCurrentScores =
        prefs.getStringList(SharedPrefrenceKeys.userScore.name) ?? [];
    userCurrentScores.add(json.encode(userScore.toJson()));
    prefs.setStringList(SharedPrefrenceKeys.userScore.name, userCurrentScores);
  }

  postUserScore() async {
    if (correctAnswers != 0) {
      final userScore = {"score": correctAnswers.toString()};
      saveUserScoreLocaly();
      await ref.read(quizRepoProvider).postUserScore(userScore);
      state = 0;
      correctAnswers = 0;
    }
  }

  AnswerStatus nextQuestion(String answer) {
    if (answer == questionsList[state].correct) {
      if (state == questionsList.length - 1) {
        correctAnswers += 1;
        postUserScore();
        return AnswerStatus.completed;
      } else {
        state = state + 1;
        correctAnswers += 1;
        return AnswerStatus.passed;
      }
    } else {
      state = 0;
      correctAnswers = 0;
      return AnswerStatus.fail;
    }
  }

  skipQuestion() {
    state = state + 1;
    ref.read(skipStateProvider.state).update((state) => true);
  }
}

final questionsStateProvider =
    StateNotifierProvider<QuetionsNotifier, int>((ref) {
  return QuetionsNotifier(ref);
});
