import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class QuizTimer extends StatelessWidget {
  const QuizTimer({
    Key? key,
    required this.onComplete,
  }) : super(key: key);
  final Function() onComplete;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: CountDownProgressIndicator(
          controller: CountDownController(),
          valueColor: Colors.grey,
          backgroundColor: primaryColor,
          initialPosition: 0,
          duration: 120,
          strokeWidth: 5,
          timeFormatter: (seconds) {
            return Duration(seconds: seconds)
                .toString()
                .split('.')[0]
                .substring(2);
          },
          timeTextStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          onComplete: onComplete),
    );
  }
}
