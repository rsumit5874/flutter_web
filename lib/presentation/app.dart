import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_admin/presentation/binding/interview_feedback_binding.dart';
import 'package:flutter_web_admin/presentation/interview/interview_feedback.dart';
import 'package:get/get.dart';
import '../resource/strings.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.title,
      initialBinding: InterviewFeedbackBinding(),
      home: const InterviewFeedbackPage(),
    );
  }
}
