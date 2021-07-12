
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage{

  static final _storage = FlutterSecureStorage();

  static const _keyUsername = 'username';
  static const _keyLoginToken = 'authtoken';
  static const _keyCollegeId = "collegeid";
  static const _keyApiUrl = "apiUrl";
  static final apiUrl = "";

  
  static Future setUsername(String username) async =>
      await _storage.write(key: _keyUsername, value: username);

  static Future<String?> getUsername() async =>
      await _storage.read(key: _keyUsername);


}

