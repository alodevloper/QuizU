import 'package:flutter/material.dart';
import 'package:quiz_okoul/core/core.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({Key? key, required this.onTryAgin, this.color})
      : super(key: key);
  final VoidCallback onTryAgin;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("An error occured try again !"),
          const SizedBox(height: 12),
          QuizUButton(
            title: "Try again",
            onPressed: onTryAgin,
            color: color,
          )
        ],
      ),
    );
  }
}
