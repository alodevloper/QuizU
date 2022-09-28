import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import './add_name_view.dart';
import '../../../../core/core.dart';
import '../../../layout/presentaion/views/main_layout.dart';
import '../../providers/auth_provider.dart';

class OtpVerificationView extends ConsumerWidget {
  const OtpVerificationView({
    Key? key,
    required this.mobile,
  }) : super(key: const Key("otpView"));
  final String mobile;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final requestStatus = ref.watch(requestStatusProvider);
    final auth = ref.read(authProvider);

    ref.listen<RequestStatusModel>(requestStatusProvider,
        (perivousStatus, currentStatus) {
      if (currentStatus.requestStatus == RequestStatus.sucess) {
        if (currentStatus.data == "new") {
          context.pushReplacment(const AddNameView());
        } else {
          context.pushReplacment(const MainLayout());
        }
      }
    });
    return Scaffold(
      body: Container(
        width: context.screenSize.width,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Phone verification",
              style: context.textTheme.headline5!
                  .copyWith(color: primaryColor, fontWeight: FontWeight.bold),
            ),
            const Text("You will get a OTP via SMS"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: SizedBox(
                width: 200,
                child: Form(
                  key: auth.otpFormKey,
                  child: PinCodeTextField(
                    autoDisposeControllers: false,
                    controller: auth.otpController,
                    hintCharacter: '*',
                    autovalidateMode: AutovalidateMode.disabled,
                    cursorColor: primaryColor,
                    pinTheme: PinTheme(
                      activeColor: primaryColor,
                      inactiveColor: primaryColor.withOpacity(0.5),
                      selectedColor: primaryColor,
                    ),
                    appContext: context,
                    length: 4,
                    keyboardType: TextInputType.number,
                    onChanged: (c) {},
                    validator: (otp) {
                      if (otp!.length == 4) {
                        return null;
                      }
                      return "please enter 4 digits";
                    },
                    errorTextSpace: 35,
                  ),
                ),
              ),
            ),
            QuizUButton(
              title: "Verify",
              loading: requestStatus.requestStatus == RequestStatus.loading,
              onPressed: () {
                if (auth.otpFormKey.currentState!.validate()) {
                  ref
                      .read(authProvider)
                      .userLogin(mobile, auth.otpController.text);
                }
              },
            ),
            requestStatus.requestStatus == RequestStatus.failed
                ? Text(
                    "\n${requestStatus.message}",
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
