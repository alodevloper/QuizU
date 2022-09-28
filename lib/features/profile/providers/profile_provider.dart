import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../quiz/data/models/user_score_model.dart';
import '../data/models/user_model.dart';
import '../data/repositries/profile_repo.dart';

final profileProvider = FutureProvider.autoDispose<UserModel>((ref) async {
  return _getUserInfo(ref.read);
});

Future<UserModel> _getUserInfo(Reader read) async {
  final response = await read(profileRepoProvider).getUserInfo();
  final prefs = await read(sharedPreferencesProvider.future);
  final data = prefs.getStringList(SharedPrefrenceKeys.userScore.name) ?? [];
  final userScoresList = List<UserScoreModel>.from(data.map(
    (score) => UserScoreModel.fromJson(
      jsonDecode(score),
    ),
  ));
  final userInfo = UserModel.fromJson(response);
  userInfo.userScores = userScoresList;
  return userInfo;
}
