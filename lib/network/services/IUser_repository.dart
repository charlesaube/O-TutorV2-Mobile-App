import 'package:demo3/model/user.dart';

abstract class IUserRepository {
  fetchWeeklyGoal();
  fetchUserById(int id);
}