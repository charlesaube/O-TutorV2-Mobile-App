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

  Category(
      {required this.courseId,
      required this.categoryId,
      required this.moderatorId,
      required this.name,
      required this.description,
      required this.bgImage,
      required this.icon,
      required this.creationDate,
      required this.isPublic});

  factory Category.fromJson(Map<String, dynamic> json) {
    return new Category(
      courseId: json['courseId'] as int,
      categoryId: json['categoryId'] as int,
      moderatorId: json['moderatorId'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      bgImage: json['bg_image'] as String,
      icon: json['icon'] as String,
      creationDate: json['creationDate'] as int,
      isPublic: json['isPublic'] as bool,
    );
  }

}
