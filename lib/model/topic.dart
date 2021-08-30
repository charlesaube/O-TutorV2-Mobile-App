class Topic {
  int id;
  String title;
  int courseId;
  String description;
  int parentId;
  int level;
  String status;
  int created;
  int modified;
  int selfAssessmentsCount;
  int formativeQuizzesCount;

  Topic({
    required this.id,
    required this.title,
    required this.courseId,
    required this.description,
    required this.parentId,
    required this.level,
    required this.status,
    required this.created,
    required this.modified,
    required this.selfAssessmentsCount,
    required this.formativeQuizzesCount,
  });

  factory Topic.fromJson(dynamic json) {
    int id = json["id"];
    dynamic title = json["title"];
    dynamic courseId = json["course_id"];
    dynamic description = json["description"];
    dynamic parentId = json["parent_id"];
    dynamic level = json["level"];
    dynamic status = json["status"];
    dynamic created = json["created"];
    dynamic modified = json["modified"];
    dynamic selfAssessmentsCount = json["self-assessments_count"];
    dynamic formativeQuizzesCount = json["formative_quizzes_count"];

    return Topic(
        id: id,
        title: title,
        courseId: courseId,
        description: description,
        parentId: parentId,
        level: level,
        status: status,
        created: created,
        modified: modified,
        selfAssessmentsCount: selfAssessmentsCount,
        formativeQuizzesCount: formativeQuizzesCount);
  }
}
