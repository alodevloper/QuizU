import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/leaderboard_model.dart';
import '../data/repositries/leaderboard_repo.dart';

final topScoresProvider = FutureProvider<List<LeaderboardModel>>((ref) async {
  return _getTopScores(ref.read);
});

Future<List<LeaderboardModel>> _getTopScores(Reader read) async {
  final response = await read(leaderboardRepoProvider).getTopScores();
  final topScoresList = List<LeaderboardModel>.from(
    response.map(
      // ignore: unnecessary_lambdas
      (item) => LeaderboardModel.fromJson(item),
    ),
  );

  return topScoresList;
}
