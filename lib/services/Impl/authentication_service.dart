import 'dart:io';

import 'package:http/http.dart' as http;
import '../../globals.dart' as globals;

class AuthenticationService {
  String url = globals.Globals.ApiUrl;

  Future<http.Response> authentication(String username, String password ) async{
    final response = await http.get(Uri.parse(url),
    headers: {
      HttpHeaders.authorizationHeader: ""
    });
    print(response.body);
    return http.get(Uri.parse(url));
  }
}