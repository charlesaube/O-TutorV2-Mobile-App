import 'package:demo3/model/user.dart';

import 'group.dart';

class Startup {
  List<Group> groups;
  List<User> users;

  Startup(this.groups, this.users);

  factory Startup.fromJson(dynamic json){
    var groupObjJson = json['groups']  as List;
    List<Group> _groups = groupObjJson.map((groupJson) => Group.fromJson(groupJson)).toList();

    var userObjJson = json['users']  as List;
    List<User> _users = userObjJson.map((userJson) => User.fromJson(userJson)).toList();

    return Startup(_groups, _users);
  }
}