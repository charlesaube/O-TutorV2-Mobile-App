/// quiz_id : 45
/// assign_date : 1469455104
/// start_date : 1469455104
/// end_date : 1469455104

class AssignedQuizzes {
  int quizId;
  int assignDate;
  int startDate;
  int endDate;

  AssignedQuizzes({
    required this.quizId,
    required this.assignDate,
    required this.startDate,
    required this.endDate});

  factory AssignedQuizzes.fromJson(Map<String, dynamic> json) {
    return AssignedQuizzes(
        quizId: json["quiz_id"],
        assignDate: json["assign_date"],
        startDate: json["start_date"],
        endDate : json["end_date"],);

  }



}

