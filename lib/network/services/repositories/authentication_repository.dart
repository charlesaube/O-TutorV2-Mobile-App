import 'dart:convert';

import '../../api_client.dart';
import '../IAuthentication_repository.dart';

class AuthenticationRepository extends IAuthenticationRepository{

  ApiClient _helper = ApiClient();

  @override
  Future<String> authenticate(Map<String, String> body) async {
    final response = await _helper.post("/auth/token/", body );
    print("Test Json");
    print(response[0]['token']);
    return response[0]['token'];
  }


}