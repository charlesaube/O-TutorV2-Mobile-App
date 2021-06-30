import 'package:flutter/cupertino.dart';

import 'assignedQuizzes.dart';


class Group {
  int id;
  String name;
  int courseId;
  String courseName;
  int tutorId;
  String tutorName;
  int semesterId;
  String description;
  String status;
  int addedBy;
  bool isAdmin;
  int created;
  int modified;
  String language;
  int openFormativeQuizzesCount;
  int totalFormativeQuizzesCount;
  int topicsTotalCount;
  int topicsLevel0Count;
  int topicsLevel1Count;
  int topicsLevel2Count;
  int topicsLevel3Count;
  String image;
  int forumTotalDiscussionsCount;
  int forumUnreadDiscussionsCount;
  List<AssignedQuizzes> assignedQuizzes;

  Group({
    required this.id,
    required this.name,
    required this.courseId,
    required this.tutorId,
    required this.tutorName,
    required this.courseName,
    required this.semesterId,
    required this.description,
    required this.status,
    required this.addedBy,
    required this.isAdmin,
    required this.created,
    required this.modified,
    required this.language,
    required this.openFormativeQuizzesCount,
    required this.totalFormativeQuizzesCount,
    required this.topicsTotalCount,
    required this.topicsLevel0Count,
    required this.topicsLevel1Count,
    required this.topicsLevel2Count,
    required this.topicsLevel3Count,
    required this.image,
    required this.forumTotalDiscussionsCount,
    required this.forumUnreadDiscussionsCount,
    required this.assignedQuizzes, });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json["id"],
      name: json["name"],
      courseId: json["course_id"],
      courseName: json["course_name"],
      tutorId: json["tutor_id"],
      tutorName: json["tutor_name"],
      semesterId: json["semester_id"],
      description: json["description"],
      status: json["status"],
      addedBy: json["added_by"],
      isAdmin: json["is_admin"],
      created: json["created"],
      modified: json["modified"],
      language: json["language"],
      openFormativeQuizzesCount: json["open_formative_quizzes_count"],
      totalFormativeQuizzesCount: json["total_formative_quizzes_count"],
      topicsTotalCount: json["topics_total_count"],
      topicsLevel0Count: json["topics_level0_count"],
      topicsLevel1Count: json["topics_level1_count"],
      topicsLevel2Count: json["topics_level2_count"],
      topicsLevel3Count: json["topics_level3_count"],
      image: json["image"],
      forumTotalDiscussionsCount: json["forum_total_discussions_count"],
      forumUnreadDiscussionsCount: json["forum_unread_discussions_count"],
      assignedQuizzes: [],
    );
  }
}


