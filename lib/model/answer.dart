class Answer {
  int id;
  String answer;
  int displayOrder;
  String answerText;
  bool isTrue;

  Answer(
    this.id,
    this.answer,
    this.displayOrder,
    this.answerText,
    this.isTrue,
  );

  factory Answer.fromJson(dynamic json) {
    int id = json['id'];
    String answer = json['answer'] as String;
    String answerText = json['answer_text'] as String;
    int displayOrder = json['display_order'] as int;
    bool isTrue = json['is_answer'] as bool;

    return Answer(id, answer, displayOrder, answerText, isTrue);
  }
}
