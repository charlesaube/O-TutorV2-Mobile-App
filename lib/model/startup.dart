import 'package:demo3/model/user.dart';

import 'group.dart';

class Startup {
  List<Group> groups;
  User user;

  Startup(this.groups, this.user);

  factory Startup.fromJson(dynamic json){
    var groupObjJson = json['groups']  as List;
    List<Group> _groups = groupObjJson.map((groupJson) => Group.fromJson(groupJson)).toList();

    User _user = User.fromJson(json['users'] );

    return Startup(_groups, _user);
  }
}