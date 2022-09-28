class LeaderboardModel {
  LeaderboardModel({
    required this.name,
    required this.score,
  });
  late final String name;
  late final int score;

  LeaderboardModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    score = json['score'];
  }
}
