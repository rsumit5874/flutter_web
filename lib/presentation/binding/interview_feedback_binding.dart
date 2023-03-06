import 'package:flutter_web_admin/view_models/interview_feedback_controller.dart';
import 'package:get/get.dart';

class InterviewFeedbackBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<InterviewFeedbackController>(InterviewFeedbackController());
  }
}