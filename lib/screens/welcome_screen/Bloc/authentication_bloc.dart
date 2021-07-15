import 'dart:async';

import 'package:demo3/model/movie_demo.dart';
import 'package:demo3/network/api_response.dart';
import 'package:demo3/network/services/IAuthentication_repository.dart';
import 'package:demo3/network/services/repositories/authentication_repository.dart';
import 'package:demo3/network/services/service_providers/service_provider.dart';

class AuthenticationBloc{

  late IAuthenticationRepository _authenticationRepository;

   var _authenticationController = StreamController<ApiResponse<String>>();
  StreamSink<ApiResponse<String>> get authSink => _authenticationController.sink;

  Stream<ApiResponse<String>> get authStream => _authenticationController.stream;

  AuthenticationBloc(){
    _authenticationController = StreamController<ApiResponse<String>>();
    _authenticationRepository = ServiceProvider().fetchAuthenticationRepository();
  }

  authenticate(String username, String password) async{
    authSink.add(ApiResponse.loading('Authenticating'));
    try {
      String movies = await _authenticationRepository.authenticate({"Username": username,"Password":password });
      authSink.add(ApiResponse.completed(movies));
    } catch (e) {
      authSink.add(ApiResponse.error(e.toString()));
      print(e);
    }

  }

  dispose() {
    _authenticationController.close();
  }
}