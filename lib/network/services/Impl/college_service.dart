import 'package:demo3/model/college.dart';
import 'package:demo3/network/services/ICategory_repository.dart';

import '../ICollege_repository.dart';

class CollegeService extends ICollegeRepository{
  List<College> fetchColleges(){

    College c1 = new College("Valleyfield");
    College c2 = new College("John Abbott");
    List<College> colleges= [];
    colleges.add(c1);
    colleges.add(c2);
    return colleges;
  }
}