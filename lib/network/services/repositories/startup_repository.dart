import 'package:demo3/model/startup.dart';
import 'package:demo3/network/api_client.dart';
import 'package:demo3/network/services/IStartup_repository.dart';

class StartupRepository extends IStartupRepository{

  ApiClient _helper = ApiClient();
  
  @override
  Future<Startup> fetchStartup() async {
    final response = await _helper.get("mobile/startup/");
    return Startup.fromJson(response);
  }

}