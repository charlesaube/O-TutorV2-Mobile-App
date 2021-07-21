import 'dart:async';

import 'package:demo3/network/api_response.dart';
import 'package:demo3/network/services/IUser_repository.dart';
import 'package:demo3/network/services/service_providers/service_provider.dart';

class SettingsBloc {
  late IUserRepository _userRepository;

  var _startupController = StreamController<ApiResponse<String>>();

  StreamSink<ApiResponse<String>> get startupSink => _startupController.sink;

  Stream<ApiResponse<String>> get startupStream => _startupController.stream;

  SettingsBloc() {
    _startupController = StreamController<ApiResponse<String>>();
    _userRepository = ServiceProvider().fetchUserRepository();
  }

  updatePassword() async {
    startupSink.add(ApiResponse.loading('Fetching Startup'));
    try {
      String startup = await _userRepository.changeEmail();
      startupSink.add(ApiResponse.completed(startup));
    } catch (e) {
      startupSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _startupController.close();
  }
}
