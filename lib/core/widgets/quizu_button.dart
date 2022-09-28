import 'package:flutter/material.dart';
import 'package:quiz_okoul/core/constants/app_colors.dart';

import '../../../../core/extensions/context_extensions.dart';

class QuizUButton extends StatelessWidget {
  const QuizUButton({
    Key? key,
    required this.title,
    this.width = 150,
    required this.onPressed,
    this.loading = false,
    this.color,
  }) : super(key: key);
  final String title;
  final double width;
  final VoidCallback onPressed;
  final bool loading;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: loading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(width, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: loading
          ? const CircularProgressIndicator()
          : Text(
              title,
              style: context.textTheme.headline6!.copyWith(
                color: color != null ? primaryColor : Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}
