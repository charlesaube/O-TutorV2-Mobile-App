
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage{

  static final _storage = FlutterSecureStorage();

  static const _keyUsername = 'username';
  static const _keyAuthToken = 'authtoken';
  static String apiUrl = "http://10.0.2.2:8000/";

  
  static Future setUsername(String username) async =>
      await _storage.write(key: _keyUsername, value: username);

  static Future<String?> getUsername() async =>
      await _storage.read(key: _keyUsername);


  static Future setAuthToken(String loginToken) async =>
      await _storage.write(key: _keyAuthToken, value: loginToken);

  static Future<String?> getAuthToken() async =>
      await _storage.read(key: _keyAuthToken);





}

