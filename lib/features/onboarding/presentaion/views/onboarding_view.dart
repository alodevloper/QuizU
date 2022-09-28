import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/core.dart';
import '../../../auth/presentaion/views/login_view.dart';

class OnboardingView extends ConsumerWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          width: context.screenSize.width,
          child: VerticalSlidingAnimation(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "QuizU",
                  style: context.textTheme.headline4!.copyWith(
                      color: primaryColor, fontWeight: FontWeight.bold),
                ),
                SvgPicture.asset(
                  introImage,
                  width: 300,
                ),
                Text("Wellcom to QuizU", style: context.textTheme.headline5),
                const Text(
                  "It's a simple quiz app the give you 2 mintues to answer questions",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                QuizUButton(
                  title: "Let's Go",
                  onPressed: () {
                    setIsFirst(ref);
                    context.pushReplacment(const LoginView());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  setIsFirst(WidgetRef ref) async {
    final prefs = await ref.read(sharedPreferencesProvider.future);
    prefs.setBool(SharedPrefrenceKeys.isFirst.name, false);
  }
}
