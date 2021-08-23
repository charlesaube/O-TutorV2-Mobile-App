import 'dart:async';
import 'package:demo3/model/quiz.dart';
import 'package:demo3/model/quiz_attempt.dart';
import 'package:demo3/model/self_assessment.dart';
import 'package:demo3/network/api_response.dart';
import 'package:demo3/network/services/IQuiz_repository.dart';
import 'package:demo3/network/services/ISelf_assessments_repository.dart';
import 'package:demo3/network/services/service_providers/service_provider.dart';
import 'package:demo3/screens/quiz_assessment/create_self_assessments.dart';

class SelfAssessmentBloc {
  late ISelfAssesmentsRepository _selfAssesmentRepository;

  var _selfAssessmentController = StreamController<ApiResponse<SelfAssessment>>();
  StreamSink<ApiResponse<SelfAssessment>> get selfAssessmentSink => _selfAssessmentController.sink;
  Stream<ApiResponse<SelfAssessment>> get selfAssessmentStream => _selfAssessmentController.stream;

  selfAssessmentBloc() {
    _selfAssessmentController = StreamController<ApiResponse<SelfAssessment>>();
    _selfAssesmentRepository = ServiceProvider().fetchSelfAssessmentsRepository();
  }

  createSelfAssessments(int courseId, List<int> topics, String duration, int totalQuestion) async {
    // Map<String, dynamic> body = {
    //   "course_id": courseId,
    //   "topics": topics,
    //   "duration": duration,
    //   "total_question": totalQuestion
    // };
    Map<String, dynamic> body = {
      "course_id": 2,
      "topics": [24, 76, 34, 22],
      "duration": "2:00",
      "total_question": 23
    };
    selfAssessmentSink.add(ApiResponse.loading('Creating'));
    SelfAssessment? selfAssessment;
    try {
      selfAssessment = await _selfAssesmentRepository.createSelfAssesment(body);
      selfAssessmentSink.add(ApiResponse.completed(selfAssessment));
    } catch (e) {
      selfAssessmentSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
    return selfAssessment;
  }

  dispose() {
    _selfAssessmentController.close();
  }
}
