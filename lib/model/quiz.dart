class Quiz {
  int id;
  String title;
  int type;
  int courseId;
  String courseName;
  int questionPage;
  int attemptsCount;
  bool randomQuestions;
  bool randomChoices;
  bool showGrade;
  bool showCorrection;
  int timelimit;
  bool isQuizbank;
  int noOfQuestions;
  String instructions;
  String status;
  int addedBy;
  int created;
  int modified;

  Quiz(
      {required this.id,
      required this.title,
      required this.type,
      required this.courseId,
      required this.courseName,
      required this.questionPage,
      required this.attemptsCount,
      required this.randomQuestions,
      required this.randomChoices,
      required this.showGrade,
      required this.showCorrection,
      required this.timelimit,
      required this.isQuizbank,
      required this.noOfQuestions,
      required this.instructions,
      required this.status,
      required this.addedBy,
      required this.created,
      required this.modified});

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json["id"],
      title: json["title"],
      type: json["type"],
      courseId: json["course_id"],
      courseName: json["course_name"],
      questionPage: json["question_page"],
      attemptsCount: json["attempts_count"],
      randomQuestions: json["random_questions"],
      randomChoices: json["random_choices"],
      showGrade: json["show_grade"],
      showCorrection: json["show_correction"],
      timelimit: json["timelimit"],
      isQuizbank: json["is_quizbank"],
      noOfQuestions: json["no_of_questions"],
      instructions: json["instructions"],
      status: json["status"],
      addedBy: json["added_by"],
      created: json["created"],
      modified: json["modified"],
    );
  }


}
