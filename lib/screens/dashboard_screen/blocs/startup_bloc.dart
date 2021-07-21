import 'dart:async';

import 'package:demo3/model/startup.dart';
import 'package:demo3/network/api_response.dart';
import 'package:demo3/network/services/IStartup_repository.dart';
import 'package:demo3/network/services/service_providers/service_provider.dart';

class StartupBloc {
  late IStartupRepository _startupRepository;
  static Startup? _cachedStartup;

  var _startupController = StreamController<ApiResponse<Startup>>();

  StreamSink<ApiResponse<Startup>> get startupSink => _startupController.sink;

  Stream<ApiResponse<Startup>> get startupStream => _startupController.stream;

  StartupBloc() {
    _startupController = StreamController<ApiResponse<Startup>>();
    _startupRepository = ServiceProvider().fetchStartupRepository();

    //Permet de seulement faire les requètes lorsque le cache est vide.
    if (_cachedStartup == null) {
      fetchStartup();
    } else {
      startupSink.add(ApiResponse.completed(_cachedStartup!));
    }
  }

  fetchStartup() async {
    startupSink.add(ApiResponse.loading('Fetching Startup'));
    try {
      Startup startup = await _startupRepository.fetchStartup();
      _cachedStartup = startup;
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
