import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class ScoreCard extends StatelessWidget {
  const ScoreCard({
    Key? key,
    required this.title,
    required this.score,
  }) : super(key: key);
  final String title;
  final String score;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: primaryColor),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text("🎯 $score"),
        ],
      ),
    );
  }
}
