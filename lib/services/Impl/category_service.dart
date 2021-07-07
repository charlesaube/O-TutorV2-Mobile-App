import 'package:demo3/model/Category.dart';

class CategoryService {
  CategoryService();

  List<Category> getAllCategory() {
    Category c1 = new Category.basic("Physique");
    Category c2 = new Category.basic("Mathématique");
    Category c3 = new Category.basic("Science");
    Category c4 = new Category.basic("Histoire");
    Category c5 = new Category.basic("Art");
    Category c6 = new Category.basic("Chimie");
    Category c7 = new Category.basic("Informatique");

    List<Category> courseList = [];
    courseList.add(c1);
    courseList.add(c2);
    courseList.add(c3);
    courseList.add(c4);
    courseList.add(c5);
    courseList.add(c6);
    courseList.add(c7);

    return courseList;
  }


}
