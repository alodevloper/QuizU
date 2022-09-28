import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/core.dart';
import '../../../layout/presentaion/views/main_layout.dart';
import '../../providers/auth_provider.dart';

class AddNameView extends ConsumerWidget {
  const AddNameView({Key? key}) : super(key: const Key("nameView"));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.read(authProvider);
    final requestStatus = ref.watch(requestStatusProvider);
    ref.listen<RequestStatusModel>(requestStatusProvider,
        (perivousStatus, currentStatus) {
      if (currentStatus.requestStatus == RequestStatus.sucess) {
        context.pushReplacment(const MainLayout());
      }
    });
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        width: context.screenSize.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("What's your name ?"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Form(
                key: auth.nameFormKey,
                child: NameTextField(
                  controller: auth.nameController,
                ),
              ),
            ),
            QuizUButton(
              title: "Done",
              loading: requestStatus.requestStatus == RequestStatus.loading,
              onPressed: () {
                if (auth.nameFormKey.currentState!.validate()) {
                  ref.read(authProvider).postUsername();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class NameTextField extends StatelessWidget with InputValidation {
  const NameTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: ((name) => nameValidation(name)),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0XFFcdcdcd)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
