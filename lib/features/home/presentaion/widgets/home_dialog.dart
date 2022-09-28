import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/core.dart';
import '../../../quiz/presentaion/views/questions_view.dart';

class HomeDialog extends StatelessWidget {
  const HomeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          homeDialogImage,
          width: 150,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Text(
            "You have 2 mins to answer 30 questions",
            textAlign: TextAlign.center,
          ),
        ),
        QuizUButton(
            title: "Start",
            onPressed: () {
              context.pop();
              context.push(const QuestionsView());
            })
      ],
    );
  }
}
