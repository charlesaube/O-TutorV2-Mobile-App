import 'package:demo3/network/api_client.dart';

import '../IUser_repository.dart';

class UserRepository implements IUserRepository {
  ApiClient _helper = ApiClient();

  fetchWeeklyGoal() {
    return 0.8;
  }

  @override
  fetchUserById(int id) {
    // TODO: implement fetchUserById
    throw UnimplementedError();
  }

  @override
  changeEmail(Map<String, String> body) {
    throw UnimplementedError();
  }

  @override
  changePassword(Map<String, String> body) async {
    final response = await _helper.post("/settings/password", body);

    return response['response'];
  }
}
