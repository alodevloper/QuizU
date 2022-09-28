import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../data/repositeries/auth_repo.dart';

class AuthProvider {
  AuthProvider(this.ref);
  final Ref ref;
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  final nameController = TextEditingController();
  bool phoneValidation = false;
  final otpFormKey = GlobalKey<FormState>();
  final nameFormKey = GlobalKey<FormState>();

  verifyUserToken() async {
    try {
      ref.read(requestStatusProvider.notifier).update(
          (state) => RequestStatusModel(requestStatus: RequestStatus.loading));
      final response = await ref.read(authRepoProvider).tokenVerfication();
      log(response.toString());
      if (response["success"]) {
        ref.read(requestStatusProvider.notifier).update(
            (state) => RequestStatusModel(requestStatus: RequestStatus.sucess));
      } else {
        ref
            .read(requestStatusProvider.notifier)
            .update((state) => RequestStatusModel(
                  requestStatus: RequestStatus.failed,
                ));
      }
    } catch (e) {
      ref.read(requestStatusProvider.notifier).update(
          (state) => RequestStatusModel(requestStatus: RequestStatus.error));
    }
  }

  userLogin(String mobile, String otp) async {
    try {
      ref.read(requestStatusProvider.notifier).update(
          (state) => RequestStatusModel(requestStatus: RequestStatus.loading));
      final loginBody = {"OTP": otp, "mobile": mobile};
      log(loginBody.toString());
      final response = await ref.read(authRepoProvider).userLogin(loginBody);
      if (response["success"]) {
        final prefs = await ref.read(sharedPreferencesProvider.future);
        await prefs.setString(
            SharedPrefrenceKeys.token.name, response["token"]);
        ref.read(requestStatusProvider.notifier).update((state) =>
            RequestStatusModel(
                requestStatus: RequestStatus.sucess,
                data: response["user_status"]));
      } else {
        ref.read(requestStatusProvider.notifier).update((state) =>
            RequestStatusModel(
                requestStatus: RequestStatus.failed,
                message: response["message"]));
      }
    } catch (e) {
      ref.read(requestStatusProvider.notifier).update(
          (state) => RequestStatusModel(requestStatus: RequestStatus.error));
      log(e.toString());
    }
  }

  postUsername() async {
    try {
      ref.read(requestStatusProvider.notifier).update(
          (state) => RequestStatusModel(requestStatus: RequestStatus.loading));
      final postUsernameBody = {"name": nameController.text};
      final response =
          await ref.read(authRepoProvider).postUserName(postUsernameBody);
      log(response.toString());
      if (response["success"]) {
        ref.read(requestStatusProvider.notifier).update(
            (state) => RequestStatusModel(requestStatus: RequestStatus.sucess));
      } else {
        ref.read(requestStatusProvider.notifier).update((state) =>
            RequestStatusModel(
                requestStatus: RequestStatus.failed,
                message: response["message"]));
      }
    } catch (e) {
      log(e.toString());
      ref.read(requestStatusProvider.notifier).update(
          (state) => RequestStatusModel(requestStatus: RequestStatus.error));
    }
  }

  logoutUser() async {
    await ref.read(authRepoProvider).logoutUser();
  }
}

final authProvider = Provider<AuthProvider>((ref) {
  return AuthProvider(ref);
});
