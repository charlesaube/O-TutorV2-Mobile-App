class Group {
  int id;
  String name;
  String tutorId;
  String tutorName;
  String semesterId;
  String description;
  String status;
  String addedBy;
  String isAdmin;
  String created;
  String modified;
  dynamic image;
  String courseName;
  int openFormativeQuizzesCount;
  int totalFormativeQuizzesCount;
  int topicsTotalCount;
  int topicsLevel0Count;
  int topicsLevel1Count;
  int topicsLevel2Count;
  int topicsLevel3Count;
  int forumTotalDiscussionsCount;
  int forumUnreadDiscussionsCount;
  List<dynamic>? assignedQuizzes;

  Group(
      this.id,
      this.name,
      this.tutorId,
      this.tutorName,
      this.semesterId,
      this.description,
      this.status,
      this.addedBy,
      this.isAdmin,
      this.created,
      this.modified,
      this.image,
      this.courseName,
      this.openFormativeQuizzesCount,
      this.totalFormativeQuizzesCount,
      this.topicsTotalCount,
      this.topicsLevel0Count,
      this.topicsLevel1Count,
      this.topicsLevel2Count,
      this.topicsLevel3Count,
      this.forumTotalDiscussionsCount,
      this.forumUnreadDiscussionsCount,
      [this.assignedQuizzes]);

  factory Group.fromJson(dynamic json) {
    dynamic id = int.parse(json['id']);
    dynamic name = json['name'];
    dynamic tutorId = json["tutor_id"];
    dynamic tutorName = json["tutor_name"];
    dynamic semesterId = json["semester_id"];
    dynamic description = json["description"];
    dynamic status = json["status"];
    dynamic addedBy = json["added_by"];
    dynamic isAdmin = json["is_admin"];
    dynamic created = json["created"];
    dynamic modified = json["modified"];
    dynamic image = json["image"];
    dynamic courseName = json["course_name"];
    dynamic openFormativeQuizzesCount = json["open_formative_quizzes_count"];
    dynamic totalFormativeQuizzesCount = json["total_formative_quizzes_count"];
    dynamic topicsTotalCount = json["topics_total_count"];
    dynamic topicsLevel0Count = json["topics_level0_count"];
    dynamic topicsLevel1Count = json["topics_level1_count"];
    dynamic topicsLevel2Count = json["topics_level2_count"];
    dynamic topicsLevel3Count = json["topics_level3_count"];
    dynamic forumTotalDiscussionsCount = json["forum_total_discussions_count"];
    dynamic forumUnreadDiscussionsCount = json["forum_unread_discussions_count"];
    dynamic assignedQuizzes = [];
    if (json["assigned_quizzes"] != null) {
      dynamic assignedQuizzes = [];
      json["assigned_quizzes"].forEach((v) {
        assignedQuizzes.add(assignedQuizzes.fromJson(v));
      });
    }
    return Group(
        id,
        name,
        tutorId,
        tutorName,
        semesterId,
        description,
        status,
        addedBy,
        isAdmin,
        created,
        modified,
        image,
        courseName,
        openFormativeQuizzesCount,
        totalFormativeQuizzesCount,
        topicsTotalCount,
        topicsLevel0Count,
        topicsLevel1Count,
        topicsLevel2Count,
        topicsLevel3Count,
        forumTotalDiscussionsCount,
        forumUnreadDiscussionsCount,
        assignedQuizzes);
  }

  @override
  String toString() {
    return "GroupId: ${this.id} description: ${this.description} ";
  }

  Group clone() {
    return Group(
        this.id,
        this.name,
        this.tutorId,
        this.tutorName,
        this.semesterId,
        this.description,
        this.status,
        this.addedBy,
        this.isAdmin,
        this.created,
        this.modified,
        this.image,
        this.courseName,
        this.openFormativeQuizzesCount,
        this.totalFormativeQuizzesCount,
        this.topicsTotalCount,
        this.topicsLevel0Count,
        this.topicsLevel1Count,
        this.topicsLevel2Count,
        this.topicsLevel3Count,
        this.forumTotalDiscussionsCount,
        this.forumUnreadDiscussionsCount,
        this.assignedQuizzes);
  }
}
