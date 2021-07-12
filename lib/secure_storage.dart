
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage{

  static final _storage = FlutterSecureStorage();

  static const _keyUsername = 'username';
  static const _keyLoginToken = 'authtoken';
  static final apiUrl = "";
  static final apiSecret ="";

  
  static Future setUsername(String username) async =>
      await _storage.write(key: _keyUsername, value: username);

  static Future<String?> getUsername() async =>
      await _storage.read(key: _keyUsername);


  static Future setLoginToken(String loginToken) async =>
      await _storage.write(key: _keyLoginToken, value: loginToken);

  static Future<String?> getLoginToken() async =>
      await _storage.read(key: _keyLoginToken);





}

