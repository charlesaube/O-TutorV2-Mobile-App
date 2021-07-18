class Quiz {
  late int id;
  late String quizTitle;
  late String quizType;
  late String courseId;
  late String questionsPage;
  late String attempts;
  late String randomQuestions;
  late String randomChoice;
  late dynamic showGrade;
  late dynamic showCorrection;
  late String timelimit;
  late String isQuizbank;
  late String noOfQuestions;
  late String instructions;
  late String status;
  late String addedBy;
  late String created;
  late String modified;

  Quiz.basic(this.quizTitle, this.id);

  Quiz(
      this.id,
      this.quizTitle,
      this.quizType,
      this.courseId,
      this.questionsPage,
      this.attempts,
      this.randomQuestions,
      this.randomChoice,
      this.timelimit,
      this.isQuizbank,
      this.noOfQuestions,
      this.instructions,
      this.status,
      this.addedBy,
      this.created,
      this.modified,
      [this.showGrade,
      this.showCorrection]);

  factory Quiz.fromJson(dynamic json) {
    dynamic id = int.parse(json["id"]);
    dynamic quizTitle = json["quize_title"];
    dynamic quizType = json["quiz_type"];
    dynamic courseId = json["course_id"];
    dynamic questionsPage = json["questions_page"];
    dynamic attempts = json["attempts"];
    dynamic randomQuestions = json["random_questions"];
    dynamic randomChoice = json["random_choice"];
    dynamic showGrade = json["show_grade"];
    dynamic showCorrection = json["show_correction"];
    dynamic timelimit = json["timelimit"];
    dynamic isQuizbank = json["is_quizbank"];
    dynamic noOfQuestions = json["no_of_questions"];
    dynamic instructions = json["instructions"];
    dynamic status = json["status"];
    dynamic addedBy = json["added_by"];
    dynamic created = json["created"];
    dynamic modified = json["modified"];

    return Quiz(
        id,
        quizTitle,
        quizType,
        courseId,
        questionsPage,
        attempts,
        randomQuestions,
        randomChoice,
        timelimit,
        isQuizbank,
        noOfQuestions,
        instructions,
        status,
        addedBy,
        created,
        modified,
        showGrade,
        showCorrection);
  }

  @override
  String toString() {
    return 'Quiz{id: $id, quizTitle: $quizTitle, quizType: $quizType, courseId: $courseId, questionPage: $questionsPage, attempts: $attempts, randomQuestions: $randomQuestions, randomChoice: $randomChoice, showGrade: $showGrade, showCorrection: $showCorrection, timelimit: $timelimit, isQuizbank: $isQuizbank, noOfQuestions: $noOfQuestions, instructions: $instructions, status: $status, addedBy: $addedBy, created: $created, modified: $modified}';
  }
}
