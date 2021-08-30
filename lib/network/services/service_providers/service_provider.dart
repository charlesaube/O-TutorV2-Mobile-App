import 'package:demo3/model/question.dart';
import 'package:demo3/network/services/repositories/authentication_repository.dart';
import 'package:demo3/network/services/repositories/college_repository.dart';
import 'package:demo3/network/services/repositories/question_repository.dart';
import 'package:demo3/network/services/repositories/quiz_repository.dart';
import 'package:demo3/network/services/repositories/self_assessement_repository.dart';
import 'package:demo3/network/services/repositories/startup_repository.dart';
import 'package:demo3/network/services/repositories/topic_repository.dart';
import 'package:demo3/network/services/repositories/user_repository.dart';
import 'package:demo3/screens/welcome_screen/colleges.dart';

class ServiceProvider {
  UserRepository fetchUserRepository() {
    return UserRepository();
  }

  CollegeRepository fetchCollegeService() {
    return CollegeRepository();
  }

  AuthenticationRepository fetchAuthenticationRepository() {
    return AuthenticationRepository();
  }

  StartupRepository fetchStartupRepository() {
    return StartupRepository();
  }

  QuizRepository fetchQuizRepository() {
    return QuizRepository();
  }

  QuestionRepository fetchQuestionRepository() {
    return QuestionRepository();
  }

  SelfAssessmentRepository fetchSelfAssessmentsRepository() {
    return SelfAssessmentRepository();
  }

  TopicRepository fetchTopicRepository() {
    return TopicRepository();
  }
}
