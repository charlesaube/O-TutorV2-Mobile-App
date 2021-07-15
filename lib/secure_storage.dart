
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage{

  static final _storage = FlutterSecureStorage();

  static const _keyUsername = 'username';
  static const _keyLoginToken = 'authtoken';
  static String apiUrl = "https://otutor-f456.restdb.io/rest/";
  static String apiSecret ="4072e8fd15acedb8caa1e50c72c3821b25d39";

  
  static Future setUsername(String username) async =>
      await _storage.write(key: _keyUsername, value: username);

  static Future<String?> getUsername() async =>
      await _storage.read(key: _keyUsername);


  static Future setLoginToken(String loginToken) async =>
      await _storage.write(key: _keyLoginToken, value: loginToken);

  static Future<String?> getLoginToken() async =>
      await _storage.read(key: _keyLoginToken);





}

