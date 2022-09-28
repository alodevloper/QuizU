import '../../../quiz/data/models/user_score_model.dart';

class UserModel {
  UserModel({required this.name, required this.mobile, this.userScores});
  late final String name;
  late final String mobile;
  List<UserScoreModel>? userScores;
  UserModel.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    name = json['name'];
  }
}
