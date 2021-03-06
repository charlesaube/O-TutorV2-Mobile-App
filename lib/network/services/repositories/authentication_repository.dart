import 'package:demo3/secure_storage.dart';

import '../../api_client.dart';
import '../IAuthentication_repository.dart';

class AuthenticationRepository implements IAuthenticationRepository {
  ApiClient _helper = ApiClient();

  @override
  Future<String> authenticate(Map<String, String> body) async {
    final response = await _helper.post("auth/token/", body);
    await SecureStorage.setAuthToken(response['auth_token']);
    return response['auth_token'];
  }

  @override
  Future<String> logout() async {
    final response = await _helper.delete("auth/token/");
    return response['status'];
  }
}
