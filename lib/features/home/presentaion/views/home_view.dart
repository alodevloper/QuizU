import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/core.dart';
import '../widgets/home_dialog.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenSize.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            SvgPicture.asset(
              homeBackground,
              height: 250,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Start new quiz and get high score to be one of leaderboad members",
                textAlign: TextAlign.center,
              ),
            ),
            TweenAnimationBuilder(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(seconds: 1),
                builder: (_, value, __) {
                  return Transform.scale(
                    scale: value,
                    child: QuizUButton(
                      title: "Quiz Me",
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) => const AlertDialog(
                                  content: HomeDialog(),
                                ));
                      },
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
