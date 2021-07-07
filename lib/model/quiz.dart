class Quiz {
  late int id;
  late String title;
  late int type;
  late int courseId;
  late String courseName;
  late int questionPage;
  late int attemptsCount;
  late bool randomQuestions;
  late bool randomChoices;
  late bool showGrade;
  late bool showCorrection;
  late int timelimit;
  late bool isQuizbank;
  late int noOfQuestions;
  late String instructions;
  late String status;
  late int addedBy;
  late int created;
  late int modified;
  late String difficulty;

  Quiz.basic(this.title, this.difficulty, this.id);

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
      required this.modified,
      required this.difficulty});

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
      difficulty: json["difficulty"]
    );
  }
}
