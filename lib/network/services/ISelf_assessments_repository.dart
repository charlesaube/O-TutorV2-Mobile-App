import 'package:demo3/model/self_assessment.dart';

abstract class IStartupRepository {
  Future<SelfAssessment> createSelfAssesments(Map<String, String> body);
}
