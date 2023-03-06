import 'package:flutter/cupertino.dart';
import 'package:flutter_web_admin/core/extensions.dart';
import 'package:get/get.dart';

class InterviewFeedbackController extends GetxController {
  var totalSelectedRating = [];

  var feedbackResultController = TextEditingController().obs;
  var resultFocusNode = FocusNode().obs;
  var isTextCopied = false.obs;

  var previousResult = ''.obs;
  var getPreviousResult = false.obs;
  var changeButtonText = false.obs;
  var previousResultExperience = ''.obs;

  var feedbackOutput = ''.obs;
  var selectedExperience = ''.obs;

  var communicationRating = ''.obs;
  var basicOfFlutterDevRating = ''.obs;
  var oopsRating = ''.obs;
  var programmingLanguageFrameworkRating = ''.obs;
  var versionControlRating = ''.obs;
  var databaseRating = ''.obs;
  var basicConceptsRating = ''.obs;
  var codingLogicalRating = ''.obs;
  var advanceConceptRating = ''.obs;
  var architecturalConceptRating = ''.obs;

  var result = ''.obs;
  var grade = ''.obs;

  var currentResult = 0.0.obs;

  void showResult() {
    var sum = totalSelectedRating.reduce((a, b) => a + b);
    if (previousResult.value.isNotEmpty) {
      getPreviousResult.value = true;
    } else {
      getPreviousResult.value = false;
    }
    currentResult.value = (sum / totalSelectedRating.length);
    grade.value = currentResult.value.getGrade();
    result.value = currentResult.toStringAsFixed(1);
    updateRating();
    previousResult.value = feedbackResultController.value.text;
    previousResultExperience.value = selectedExperience.value;
  }

  void updateRating() {
    feedbackResultController.value.text =
        '1. Communication: ${communicationRating.toString().getRating() ?? ''}\n'
        '2. Basic Of Flutter Development: ${basicOfFlutterDevRating.toString().getRating() ?? ''}\n'
        '3. OOPs: ${oopsRating.toString().getRating() ?? ''}\n'
        '4. Programing Language / Framework: ${programmingLanguageFrameworkRating.toString().getRating() ?? ''}\n'
        '5. Version Control: ${versionControlRating.toString().getRating() ?? ''}\n'
        '6. Database: ${databaseRating.toString().getRating() ?? ''}\n'
        '7. Basic Concepts: ${basicConceptsRating.toString().getRating() ?? ''}\n'
        '8. Coding (Logical): ${codingLogicalRating.toString().getRating() ?? ''}\n'
        '9. Advanced Concepts: ${advanceConceptRating.toString().getRating() ?? ''}\n'
        '10. Architectural Concepts: ${architecturalConceptRating.toString().getRating() ?? ''}\n\n'
        '--------------------------\n\n'
        'The Result is: ${result ?? ''}\n'
        'Overall Grade: ${grade ?? ''}\n';

    totalSelectedRating.clear();
    totalSelectedRating = [
      communicationRating.toString().getRatingInt(),
      basicOfFlutterDevRating.toString().getRatingInt(),
      oopsRating.toString().getRatingInt(),
      programmingLanguageFrameworkRating.toString().getRatingInt(),
      versionControlRating.toString().getRatingInt(),
      databaseRating.toString().getRatingInt(),
      basicConceptsRating.toString().getRatingInt(),
      codingLogicalRating.toString().getRatingInt(),
      advanceConceptRating.toString().getRatingInt(),
      architecturalConceptRating.toString().getRatingInt()
    ];

    try {
      totalSelectedRating.removeWhere((item) => item == 0);
    } catch (e) {}
  }

  void textCopied() async {
    if (resultFocusNode.value.hasFocus) {
      resultFocusNode.value.unfocus();
    }
    isTextCopied.value = true;
    resultFocusNode.value.requestFocus();
    feedbackResultController.value.selection = TextSelection(
        baseOffset: 0,
        extentOffset: feedbackResultController.value.text.length);
    await Future.delayed(const Duration(seconds: 2));
    isTextCopied.value = false;
  }
}
