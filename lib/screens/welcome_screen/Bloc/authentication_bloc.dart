import 'dart:async';

import 'package:demo3/network/api_response.dart';
import 'package:demo3/network/services/repositories/authentication_repository.dart';

class AuthenticationBloc{

  late AuthenticationRepository _authenticationRepository;

   var _authenticationController = StreamController<ApiResponse<String>>();
  StreamSink<ApiResponse<String>> get _authSink => _authenticationController.sink;

  Stream<ApiResponse<String>> get _authStream => _authenticationController.stream;

  AuthenticationBloc(){
    _authenticationController = StreamController<ApiResponse<String>>();

  }

  authenticate() async{
    _authSink.add(ApiResponse.loading('Authenticating'));

  }

  dispose() {
    _authenticationController.close();
  }
}