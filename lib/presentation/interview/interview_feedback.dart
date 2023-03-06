import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_admin/presentation/interview/widgets.dart';
import 'package:flutter_web_admin/resource/dimen.dart';

import '../widgets/custom_widgets.dart';

class InterviewFeedbackPage extends StatelessWidget {
  const InterviewFeedbackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              padding: const EdgeInsets.only(bottom: size25),
              margin: const EdgeInsets.symmetric(horizontal: size25),
              child: ResponsiveLayout(
                mobile: ListView(
                  primary: false,
                  shrinkWrap: true,
                  children: const [
                    FeedbackWidget(),
                    ResultWidget(),
                  ],
                ),
                desktop: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Expanded(flex: dimen5, child: FeedbackWidget()),
                    Expanded(flex: dimen3, child: ResultWidget())
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
