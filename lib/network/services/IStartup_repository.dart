import 'package:demo3/model/startup.dart';

abstract class IStartupRepository{
  Future<Startup> fetchStartup();


}