import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_admin/view_models/interview_feedback_controller.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../core/constant.dart';
import '../../resource/dimen.dart';
import '../../resource/strings.dart';
import '../widgets/custom_widgets.dart';

class FeedbackWidget extends StatelessWidget {
  const FeedbackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<InterviewFeedbackController>();
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: size25),
                  child: AppWidget.getTitleText(Strings.title,
                      fontWeight: FontWeight.w700, fontSize: size25)),
              Obx(() => CustomRatingDropdown(
                    selectedValue: controller.selectedExperience.value,
                    hintText: Strings.selectExperience,
                    onSelect: (experience) {
                      if (controller.selectedExperience.value.isEmpty) {
                        controller.selectedExperience.value = experience;
                      } else if (controller.selectedExperience.value !=
                          experience) {
                        showWarningDialogue(
                            context: context,
                            title: Strings.dialogueTitle,
                            okClick: () {
                              resetFeedback(controller);
                              controller.selectedExperience.value = experience;
                              controller.getPreviousResult.value = false;
                              Get.back();
                            },
                            cancel: () {
                              Get.back();
                            });
                      }
                    },
                    listItem: listOfExperience,
                  )),
            ],
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: size15),
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: size25),
                child: ListView(
                  clipBehavior: Clip.hardEdge,
                  primary: false,
                  shrinkWrap: true,
                  children: [
                    Obx(() => SkillContainer(
                          selectedRating: controller.communicationRating.value,
                          question: '1. ${Strings.communication}',
                          rationOnSkill: (value) {
                            controller.communicationRating.value = value;
                            controller.updateRating();
                          },
                        )),
                    Obx(() => SkillContainer(
                          selectedRating:
                              controller.basicOfFlutterDevRating.value,
                          question: '2. ${Strings.basicOfFlutterDevelopment}',
                          listOfOption: listOfBasicOfFlutter,
                          rationOnSkill: (value) {
                            controller.basicOfFlutterDevRating.value = value;
                            controller.updateRating();
                          },
                        )),
                    Obx(() => SkillContainer(
                          selectedRating: controller.oopsRating.value,
                          question: '3. ${Strings.oops}',
                          rationOnSkill: (value) {
                            controller.oopsRating.value = value;
                            controller.updateRating();
                          },
                        )),
                    Obx(() => SkillContainer(
                          selectedRating: controller
                              .programmingLanguageFrameworkRating.value,
                          question: '4. ${Strings.programingLanguageFramework}',
                          listOfOption: listOfProgrammingLanguageFramework,
                          rationOnSkill: (value) {
                            controller.programmingLanguageFrameworkRating
                                .value = value;
                            controller.updateRating();
                          },
                        )),
                    Obx(() => SkillContainer(
                          selectedRating: controller.versionControlRating.value,
                          question: '5. ${Strings.versionControl}',
                          listOfOption: const [Strings.versionControl],
                          rationOnSkill: (value) {
                            controller.versionControlRating.value = value;
                            controller.updateRating();
                          },
                        )),
                    Obx(() => SkillContainer(
                          selectedRating: controller.databaseRating.value,
                          question: '6. ${Strings.database}',
                          listOfOption: const [Strings.sqfLite],
                          rationOnSkill: (value) {
                            controller.databaseRating.value = value;
                            controller.updateRating();
                          },
                        )),
                    Obx(() => SkillContainer(
                          selectedRating: controller.basicConceptsRating.value,
                          question: '7. ${Strings.basicConcepts}',
                          listOfOption: listOfBasicConcepts,
                          rationOnSkill: (value) {
                            controller.basicConceptsRating.value = value;
                            controller.updateRating();
                          },
                        )),
                    Obx(() => SkillContainer(
                          selectedRating: controller.codingLogicalRating.value,
                          question: '8. ${Strings.codingLogical}',
                          listOfOption: listOfCodingLogical,
                          rationOnSkill: (value) {
                            controller.codingLogicalRating.value = value;
                            controller.updateRating();
                          },
                        )),
                    Obx(() => SkillContainer(
                          selectedRating: controller.advanceConceptRating.value,
                          question: '9. ${Strings.advancedConcepts}',
                          listOfOption: listOfAdvanceConcepts,
                          rationOnSkill: (value) {
                            controller.advanceConceptRating.value = value;
                            controller.updateRating();
                          },
                        )),
                    Obx(() => SkillContainer(
                          selectedRating:
                              controller.architecturalConceptRating.value,
                          question: '10. ${Strings.architecturalConcepts}',
                          listOfOption: listOfArchitecturalConcepts,
                          rationOnSkill: (value) {
                            controller.architecturalConceptRating.value = value;
                            controller.updateRating();
                          },
                        )),
                  ],
                ),
              ),
            ),
          ),
          AppWidget.getButton(Strings.submit, buttonColor: Colors.green,
              onClick: () {
            if (controller.selectedExperience.value.isEmpty) {
              showTopSnackBar(
                Overlay.of(context)!,
                const CustomSnackBar.info(
                  icon: Icon(null),
                  message: Strings.pleaseSelectExperience,
                ),
              );
            } else if (controller.totalSelectedRating.isEmpty ||
                controller.totalSelectedRating.contains(-1)) {
              controller.getPreviousResult.value = true;
              showTopSnackBar(
                Overlay.of(context)!,
                const CustomSnackBar.error(
                  icon: Icon(null),
                  message: Strings.pleaseSelectAllRating,
                ),
              );
            } else {
              controller.changeButtonText.value = false;
              controller.getPreviousResult.value = false;
              controller.showResult();
            }
          })
        ],
      ),
    );
  }

  void resetFeedback(InterviewFeedbackController controller) {
    controller.communicationRating.value = '';
    controller.basicOfFlutterDevRating.value = '';
    controller.oopsRating.value = '';
    controller.programmingLanguageFrameworkRating.value = '';
    controller.versionControlRating.value = '';
    controller.databaseRating.value = '';
    controller.basicConceptsRating.value = '';
    controller.codingLogicalRating.value = '';
    controller.advanceConceptRating.value = '';
    controller.architecturalConceptRating.value = '';
    controller.result.value = '';
    controller.grade.value = '';
    controller.currentResult.value = 0.0;
    controller.updateRating();
    controller.totalSelectedRating = [];
  }

  void showWarningDialogue(
      {required BuildContext context,
      Function()? okClick,
      Function()? cancel,
      required String title}) {
    showDialog(
        context: context,
        builder: (ctx) {
          return SimpleDialog(
            alignment: Alignment.topCenter,
            insetPadding: const EdgeInsets.only(top: size25),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(size5),
              side: const BorderSide(
                color: Colors.green,
              ),
            ),
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(title,
                    style: const TextStyle(fontSize: size16, letterSpacing: 0.5)),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: size10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(color: Colors.black12, width: size1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(size5))),
                      child: TextButton(
                          onPressed: okClick,
                          child: const Text(Strings.ok,
                              style: TextStyle(color: Colors.white))),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12, width: size1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(size5))),
                      child: TextButton(
                          onPressed: cancel,
                          child: const Text(
                            Strings.cancel,
                            style: TextStyle(color: Colors.black),
                          )),
                    )
                  ],
                ),
              ),
            ],
          );
        });
  }
}

class ResultWidget extends StatelessWidget {
  const ResultWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<InterviewFeedbackController>();
    return SizedBox(
      width: Get.width,
      child: ListView(
        scrollDirection: Axis.vertical,
        primary: false,
        shrinkWrap: true,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: size25),
              child: AppWidget.getTitleText(Strings.result,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            height: size300,
            margin: const EdgeInsets.symmetric(horizontal: size15, vertical: size25),
            child: Obx(() => TextField(
                  focusNode: controller.resultFocusNode.value,
                  readOnly: true,
                  maxLines: null,
                  expands: true,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.black12,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(size5))),
                  ),
                  toolbarOptions: const ToolbarOptions(
                      copy: true, selectAll: true, cut: false, paste: false),
                  controller: controller.feedbackResultController.value,
                  showCursor: false,
                  autofocus: false,
                  style: const TextStyle(
                      height: 1.5,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: size16),
                )),
          ),
          Obx(() => AppWidget.getButton(onClick: () {
                controller.textCopied();
              },
                  controller.isTextCopied.value
                      ? Strings.copied
                      : Strings.copyToClipBoard,
                  textColor: Colors.black,
                  buttonColor: Colors.yellow.shade700)),
          const SizedBox(height: size10),
          Obx(() => controller.getPreviousResult.value &&
                  controller.previousResult.isNotEmpty
              ? AppWidget.getButton(onClick: () {
                  if (controller.changeButtonText.value == true) {
                    controller.changeButtonText.value = false;
                  } else {
                    controller.changeButtonText.value = true;
                  }
                },
                  !controller.changeButtonText.value
                      ? '${Strings.getResultByConsidering} ${controller.previousResultExperience.value}'
                      : Strings.getOriginalResult,
                  textColor: Colors.black,
                  buttonColor: Colors.white)
              : const SizedBox())
        ],
      ),
    );
  }
}
