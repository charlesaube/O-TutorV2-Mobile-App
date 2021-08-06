class Answer {
  int id;
  String answer;
  bool isTrue;

  Answer(this.id, this.answer, this.isTrue);

  factory Answer.fromJson(dynamic json) {
    int id = json['id'] as int;
    String answer = json['answer'] as String;
    bool isTrue = json['is_true'] as bool;

    return Answer(id, answer, isTrue);
  }

  toMap() {}

  static fromMap(x) {}
}
