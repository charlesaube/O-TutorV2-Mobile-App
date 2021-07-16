
class CollegeResponse{
  late int totalResults;
  late List<College> results;

  CollegeResponse.fromJson(dynamic json) {
    // print(json['id']);
    // if (json['id'] != null) {
    //   results = <College>[];
    //   json['results'].forEach((v) {
    //     if (v['id'] != null)
    //       {
    //         results.add(new College.fromJson(v));
    //       }
    //   });
    // }
   results = List<College>.from(json.map((model)=> College.fromJson(model)));

  }
}
class College{
  String id;
  String name;
  String image;

  College(this.name, this.id, this.image);

  factory College.fromJson(dynamic json){

    String id = json['id'] as String;
    String name = json['name'] as String;
    String image = json['image'] as String;

    return College(name, id, image);

  }
}
