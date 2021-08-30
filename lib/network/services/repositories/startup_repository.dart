import 'package:demo3/model/group.dart';
import 'package:demo3/model/startup.dart';
import 'package:demo3/model/user.dart';
import 'package:demo3/network/api_client.dart';
import 'package:demo3/network/services/IStartup_repository.dart';

class StartupRepository implements IStartupRepository {
  ApiClient _helper = ApiClient();

  @override
  Future<Startup> fetchStartup() async {
    final response = await _helper.get("mobile/startup/");

    var user = User.fromJson(response['user']);
    var groupObjJson = response['groups'] as List;
    List<Group> groups = groupObjJson.map((groupJson) => Group.fromJson(groupJson)).toList();
    Startup startup = new Startup(groups, user);

    //print(response);//facile d'acces à la réponse pour vérifier les id ou autre attribut pour les autres requêtes
    return startup;
  }
}
