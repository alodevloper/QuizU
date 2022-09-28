class QuestionModel {
  QuestionModel({
    required this.question,
    required this.a,
    required this.b,
    required this.c,
    required this.d,
    required this.correct,
  });
  late final String question;
  late final String a;
  late final String b;
  late final String c;
  late final String d;
  late final String correct;

  QuestionModel.fromJson(Map<String, dynamic> json) {
    question = json['Question'];
    a = json['a'];
    b = json['b'];
    c = json['c'];
    d = json['d'];
    correct = json['correct'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Question'] = question;
    data['a'] = a;
    data['b'] = b;
    data['c'] = c;
    data['d'] = d;
    data['correct'] = correct;
    return data;
  }
}
