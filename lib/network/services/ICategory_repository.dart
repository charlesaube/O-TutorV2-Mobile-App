import 'package:demo3/model/Category.dart';

abstract class ICategoryRepository{

  List<Category> fetchAllCategories();

}