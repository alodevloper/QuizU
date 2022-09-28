import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/core.dart';

class WrongAnswerView extends ConsumerWidget {
  const WrongAnswerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        width: context.screenSize.width,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              failIcon,
              width: 150,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Wrong Answer",
                style: context.theme.textTheme.titleLarge,
              ),
            ),
            QuizUButton(
              title: "Try Again 💪",
              onPressed: () {
                context.pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
