import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class QuestionsCounter extends StatelessWidget {
  const QuestionsCounter({
    Key? key,
    required this.currentQuestionIndex,
  }) : super(key: key);

  final int currentQuestionIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          padding: const EdgeInsets.all(3),
          width: 300,
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: primaryColor),
          ),
          alignment: Alignment.centerLeft,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            width: (currentQuestionIndex + 1) * 10,
            height: 15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: primaryColor,
            ),
          ),
        ),
        Positioned.fill(
          child: Center(
            child: Text(
              "${currentQuestionIndex + 1}/30",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
