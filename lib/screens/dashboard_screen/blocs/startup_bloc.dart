import 'dart:async';

import 'package:demo3/model/startup.dart';
import 'package:demo3/network/api_response.dart';
import 'package:demo3/network/services/IStartup_repository.dart';
import 'package:demo3/network/services/service_providers/service_provider.dart';

class StartupBloc{

    late IStartupRepository _startupRepository;

    var _startupController = StreamController<ApiResponse<Startup>>();
    StreamSink<ApiResponse<Startup>> get startupSink => _startupController.sink;

    Stream<ApiResponse<Startup>> get startupStream => _startupController.stream;

    StartupBloc(){
      _startupController = StreamController<ApiResponse<Startup>>.broadcast();
      _startupRepository = ServiceProvider().fetchStartupRepository();
      fetchStartup();
    }

    fetchStartup() async{
      startupSink.add(ApiResponse.loading('Fetching Startup'));
      try {
        Startup startup = await _startupRepository.fetchStartup();
        startupSink.add(ApiResponse.completed(startup));
      } catch (e) {
        startupSink.add(ApiResponse.error(e.toString()));
        print(e);
      }
    }

    dispose(){
      _startupController.close();
    }
}