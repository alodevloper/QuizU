import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../../../core/core.dart';

class QuizRepo {
  QuizRepo(this.ref);
  final Ref ref;
  getQuizQuestions() async {
    final prefs = await ref.read(sharedPreferencesProvider.future);
    final token = prefs.getString(SharedPrefrenceKeys.token.name);
    final result = await http
        .get(Uri.parse(questions), headers: {"Authorization": "Bearer $token"});
    final data = json.decode(result.body);
    return data;
  }

  postUserScore(Map<String, dynamic> scoreBody) async {
    final prefs = await ref.read(sharedPreferencesProvider.future);
    final token = prefs.getString(SharedPrefrenceKeys.token.name);
    final result = await http.post(Uri.parse(questions),
        headers: {"Authorization": "Bearer $token"}, body: scoreBody);
    final data = json.decode(result.body);
    return data;
  }
}

final quizRepoProvider = Provider<QuizRepo>((ref) {
  return QuizRepo(ref);
});
