class User {
  late String id;
  late String addedBy;
  late String parentId;
  late String username;
  late String firstName;
  late String lastName;
  late dynamic profileImage;
  late String email;
  late dynamic location;
  late dynamic description;
  late String status;
  late dynamic contactNumber;
  late String created;
  late String modified;
  late dynamic lastLogin;
  late String userType;
  late String language;
  late String emailVerify;
  late int openFormativeQuizzes;
  late int weeklyGoal;
  late int weeklyGoalProgress;
  late bool ongoingWork;
  late String ongoingWorkType;
  late int ongoingWorkId;
  List<dynamic>? assignedQuizzes;

  User(
      this.id,
      this.addedBy,
      this.parentId,
      this.username,
      this.firstName,
      this.lastName,
      this.profileImage,
      this.email,
      this.location,
      this.description,
      this.status,
      this.contactNumber,
      this.created,
      this.modified,
      this.lastLogin,
      this.userType,
      this.language,
      this.emailVerify,
      this.openFormativeQuizzes,
      this.weeklyGoal,
      this.weeklyGoalProgress,
      this.ongoingWork,
      this.ongoingWorkType,
      this.ongoingWorkId,
      [this.assignedQuizzes]);

  factory User.fromJson(dynamic json) {
    dynamic id = json["id"];
    dynamic addedBy = json["added_by"];
    dynamic parentId = json["parent_id"];
    dynamic username = json["username"];
    dynamic firstName = json["first_name"];
    dynamic lastName = json["last_name"];
    dynamic profileImage = json["profile_image"];
    dynamic email = json["email"];
    dynamic location = json["location"];
    dynamic description = json["description"];
    dynamic status = json["status"];
    dynamic contactNumber = json["contact_number"];
    dynamic created = json["created"];
    dynamic modified = json["modified"];
    dynamic lastLogin = json["last_login"];
    dynamic userType = json["user_type"];
    dynamic language = json["language"];
    dynamic emailVerify = json["email_verify"];
    dynamic openFormativeQuizzes = json["open_formative_quizzes"];
    dynamic weeklyGoal = json["weekly_goal"];
    dynamic weeklyGoalProgress = json["weekly_goal_progress"];
    dynamic ongoingWork = json["ongoing_work"];
    dynamic ongoingWorkType = json["ongoing_work_type"];
    dynamic ongoingWorkId = json["ongoing_work_id"];


    dynamic assignedQuizzes = [];
    if (json["assigned_quizzes"] != null) {
      dynamic assignedQuizzes = [];
      json["assigned_quizzes"].forEach((v) {
        assignedQuizzes.add(assignedQuizzes.fromJson(v));
      });
    }
    return User(
        id,
        addedBy,
        parentId,
        username,
        firstName,
        lastName,
        profileImage,
        email,
        location,
        description,
        status,
        contactNumber,
        created,
        modified,
        lastLogin,
        userType,
        language,
        emailVerify,
        openFormativeQuizzes,
        weeklyGoal,
        weeklyGoalProgress,
        ongoingWork,
        ongoingWorkType,
        ongoingWorkId,
        assignedQuizzes);
  }
}
