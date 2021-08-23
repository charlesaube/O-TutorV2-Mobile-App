import 'package:demo3/model/self_assessment.dart';

abstract class ISelfAssessmentsRepository {
  Future<SelfAssessment> createSelfAssesment(Map<String, dynamic> body);
}
