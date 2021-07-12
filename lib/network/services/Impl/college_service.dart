import 'package:demo3/model/college.dart';

class CollegeService{
  List<College> getCollege(){

    College c1 = new College("Valleyfield");
    College c2 = new College("John Abbott");
    List<College> colleges= [];
    colleges.add(c1);
    colleges.add(c2);
    return colleges;
  }
}