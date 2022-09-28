import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_okoul/core/core.dart';

class LeaderboardRepo {
  LeaderboardRepo(this.ref);
  final Ref ref;
  getTopScores() async {
    final prefs = await ref.read(sharedPreferencesProvider.future);
    final token = prefs.getString(SharedPrefrenceKeys.token.name);
    final result = await http
        .get(Uri.parse(topScores), headers: {"Authorization": "Bearer $token"});
    final data = json.decode(result.body);
    return data;
  }
}

final leaderboardRepoProvider = Provider<LeaderboardRepo>((ref) {
  return LeaderboardRepo(ref);
});
