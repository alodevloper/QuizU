import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:quiz_okoul/features/auth/auth.dart';

import '../../../../core/core.dart';
import '../../providers/auth_provider.dart';

class LoginView extends ConsumerWidget with InputValidation {
  const LoginView({Key? key}) : super(key: const Key("loginView"));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.read(authProvider);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        width: context.screenSize.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: context.textTheme.headline4!
                  .copyWith(color: primaryColor, fontWeight: FontWeight.bold),
            ),
            const Text("Login now and challenge yourself"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: IntlPhoneField(
                initialCountryCode: 'SA',
                controller: auth.phoneController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) async {
                  auth.phoneValidation = await phoneValidation(value!);
                  return null;
                },
              ),
            ),
            QuizUButton(
              title: "Start",
              onPressed: () {
                if (auth.phoneValidation) {
                  context.pushReplacment(OtpVerificationView(
                    mobile: auth.phoneController.text,
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Invalid mobile number'),
                    backgroundColor: Colors.red,
                  ));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
