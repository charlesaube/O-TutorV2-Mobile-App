abstract class IUserRepository {
  fetchWeeklyGoal();
  fetchUserById(int id);
  changePassword(Map<String, String> body);
  changeEmail(Map<String, String> body);
}
