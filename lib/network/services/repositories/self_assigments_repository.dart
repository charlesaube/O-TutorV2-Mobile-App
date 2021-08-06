import 'package:demo3/model/self_assessment.dart';
import 'package:demo3/network/services/ISelf_assessments_repository.dart';

import '../../api_client.dart';

class SelfAssigmentRepository extends ISelfAssesmentsRepository {
  ApiClient _helper = new ApiClient();

  @override
  Future<SelfAssessment> createSelfAssesments(Map<String, String> body) {
    // TODO: implement createSelfAssesments
    throw UnimplementedError();
  }
}
