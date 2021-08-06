import 'package:demo3/model/self_assessment.dart';

abstract class ISelfAssesmentsRepository {
  Future<SelfAssessment> createSelfAssesments(Map<String, String> body);
}
