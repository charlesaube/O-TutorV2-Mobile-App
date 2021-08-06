class ShortAnswer {
  int? id;
  String? answer;
  String? answerText;

  ShortAnswer(
    this.id,
    this.answer,
    this.answerText,
  );

  factory ShortAnswer.fromJson(dynamic json) {
    dynamic id = json['id'];
    dynamic answer = json['answer'] as String;
    dynamic answerText = json['answer_text'] as String;

    return ShortAnswer(id, answer, answerText);
  }
}
