import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/core.dart';
import '../../../auth/presentaion/views/login_view.dart';
import '../../../auth/providers/auth_provider.dart';
import '../../../layout/presentaion/views/main_layout.dart';
import '../../../onboarding/presentaion/views/onboarding_view.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  late final bool showOnboard;
  late final bool isLogined;
  @override
  void initState() {
    unawaited(getLaunchData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final requestStatus = ref.watch(requestStatusProvider);
    ref.listen<RequestStatusModel>(requestStatusProvider,
        (perivousStatus, currentStatus) {
      if (currentStatus.requestStatus == RequestStatus.sucess) {
        context.pushReplacment(const MainLayout());
      } else if (currentStatus.requestStatus == RequestStatus.failed) {
        context.pushReplacment(const LoginView());
      }
    });
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "QuizU",
              style: context.textTheme.headline3!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            requestStatus.requestStatus == RequestStatus.loading
                ? const CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  Future<void> getLaunchData() async {
    final prefs = await ref.read(sharedPreferencesProvider.future);
    showOnboard = prefs.getBool(SharedPrefrenceKeys.isFirst.name) ?? true;
    if (showOnboard) {
      Future.delayed(const Duration(milliseconds: 800), () {
        context.pushReplacment(const OnboardingView());
      });
    } else {
      await ref.read(authProvider).verifyUserToken();
    }
  }
}
