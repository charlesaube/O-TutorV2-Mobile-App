class CollegeResponse {
  late int totalResults;
  late List<College> results;

  CollegeResponse.fromJson(dynamic json) {
    results = List<College>.from(json.map((model) => College.fromJson(model)));
  }
}

class College {
  int id;
  String name;
  String image;

  College(this.name, this.id, this.image);

  factory College.fromJson(dynamic json) {
    String tempId = json['id'] as String;
    int id = int.parse(tempId);

    String name = json['name'] as String;
    String image = json['image'] as String;

    return College(name, id, image);
  }
}
