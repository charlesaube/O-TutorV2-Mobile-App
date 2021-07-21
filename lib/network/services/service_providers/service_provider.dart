

import 'package:demo3/model/question.dart';
import 'package:demo3/network/services/Impl/answer_service.dart';
import 'package:demo3/network/services/Impl/category_service.dart';
import 'package:demo3/network/services/Impl/college_service.dart';
import 'package:demo3/network/services/Impl/quiz_service.dart';
import 'package:demo3/network/services/Impl/user_service.dart';
import 'package:demo3/network/services/repositories/authentication_repository.dart';
import 'package:demo3/network/services/repositories/college_repository.dart';
import 'package:demo3/network/services/repositories/question_repository.dart';
import 'package:demo3/network/services/repositories/quiz_repository.dart';
import 'package:demo3/network/services/repositories/startup_repository.dart';
import 'package:demo3/screens/welcome_screen/colleges.dart';

class ServiceProvider{

  AnswerService getAnswerService(){
    return AnswerService();
  }

  CategoryService getCategoryService(){
    return CategoryService();
  }

  QuizService getQuizService() {
    return QuizService();
  }

  UserService getUserService() {
    return UserService();
  }
  CollegeRepository fetchCollegeService(){
    return CollegeRepository();
  }

  AuthenticationRepository fetchAuthenticationRepository(){
    return AuthenticationRepository();
  }

  StartupRepository fetchStartupRepository(){
    return StartupRepository();
  }

  QuizRepository fetchQuizRepository(){
    return QuizRepository();
  }
  QuestionRepository fetchQuestionRepository(){
    return QuestionRepository();
  }
}