class CategoryResponse{
  late int totalResults;
  late List<Category> results;

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    totalResults = json['total_results'];
    if (json['results'] != null) {
      results = <Category>[];
      json['results'].forEach((v) {
        results.add(new Category.fromJson(v));
      });
    }
  }
}

class Category {
  late int id;
  late int version;
  late String created;
  late bool mock;
  late String changed;
  late String createdBy;
  late int courseId;
  late int categoryId;
  late int moderatorId;
  late String name;
  late String description;
  late String bgImage;
  late String icon;
  late int creationDate;
  late bool isPublic;

  Category.basic(this.name,this.icon);

  // Category(
  //     {required this.courseId,
  //     required this.categoryId,
  //     required this.moderatorId,
  //     required this.name,
  //     required this.description,
  //     required this.bgImage,
  //     required this.icon,
  //     required this.creationDate,
  //     required this.isPublic});
  //
  // factory Category.fromJson(Map<String, dynamic> json) {
  //   return new Category(
  //     courseId: json['courseId'] as int,
  //     categoryId: json['categoryId'] as int,
  //     moderatorId: json['moderatorId'] as int,
  //     name: json['name'] as String,
  //     description: json['description'] as String,
  //     bgImage: json['bg_image'] as String,
  //     icon: json['icon'] as String,
  //     creationDate: json['creationDate'] as int,
  //     isPublic: json['isPublic'] as bool,
  //   );
  // }
  //
  // factory Category.fromMap(Map<String, dynamic> map) {
  //   return new Category(
  //     courseId: map['courseId'] as int,
  //     categoryId: map['categoryId'] as int,
  //     moderatorId: map['moderatorId'] as int,
  //     name: map['name'] as String,
  //     description: map['description'] as String,
  //     bgImage: map['bg_image'] as String,
  //     icon: map['icon'] as String,
  //     creationDate: map['creationDate'] as int,
  //     isPublic: map['isPublic'] as bool,
  //   );
  // }


  Category.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    courseId = json['courseId'];
    categoryId = json['categoryId'];
    moderatorId = json['moderatorId'];
    description = json['description'];
    creationDate = json['creationDate'];
    // isPublic = json['isPublic'];
    icon = json['icon'];
    bgImage = json['bg_image'];
    // version = json['_version'];
    // created = json['_created'];
    // createdBy = json['_createdBy'];
    mock = json['_mock'];

  }

}
