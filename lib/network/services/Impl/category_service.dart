import 'package:demo3/model/Category.dart';

class CategoryService {
  CategoryService();

  List<Category> getAllCategory() {
    Category c1 = new Category.basic("Psychologie", "psychology_sharp");
    Category c2 = new Category.basic("Mathématique", "moving_sharp");
    Category c3 = new Category.basic("Science","biotech");
    Category c4 = new Category.basic("Histoire","public");
    Category c5 = new Category.basic("Art","theater_comedy_rounded");
    Category c6 = new Category.basic("Chimie","science");
    Category c7 = new Category.basic("Informatique","laptop");

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
