import 'dart:async';

import 'package:demo3/network/api_response.dart';
import 'package:demo3/network/services/IUser_repository.dart';
import 'package:demo3/network/services/service_providers/service_provider.dart';

class SettingsBloc {
  late IUserRepository _userRepository;

  var _settingsController = StreamController<ApiResponse<String>>();

  StreamSink<ApiResponse<String>> get settingsSink => _settingsController.sink;

  Stream<ApiResponse<String>> get settingsStream => _settingsController.stream;

  SettingsBloc() {
    _settingsController = StreamController<ApiResponse<String>>();
    _userRepository = ServiceProvider().fetchUserRepository();
  }

  updatePassword(String oldPassword, String newPassword) async {
    settingsSink.add(ApiResponse.loading('Loading'));
    try {
      String response = await _userRepository.changeEmail(
          {"old_password": oldPassword, "new_password": newPassword});
      settingsSink.add(ApiResponse.completed(response));
    } catch (e) {
      settingsSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _settingsController.close();
  }
}
