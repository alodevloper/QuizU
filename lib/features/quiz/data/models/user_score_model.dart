class UserScoreModel {
  UserScoreModel({
    required this.score,
    required this.time,
  });
  late final int score;
  late final String time;

  UserScoreModel.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    time = json['time'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['score'] = score;
    data['time'] = time;
    return data;
  }
}
