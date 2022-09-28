import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/core.dart';
import '../../../auth/presentaion/views/login_view.dart';
import '../../../auth/providers/auth_provider.dart';
import '../../data/models/user_model.dart';

class UserDataWidget extends ConsumerWidget {
  const UserDataWidget({
    Key? key,
    required this.userData,
  }) : super(key: key);
  final UserModel userData;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return VerticalSlidingAnimation(
      duration: const Duration(seconds: 1),
      child: Container(
        alignment: Alignment.center,
        height: 150,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          leading: const Text("🧑", style: TextStyle(fontSize: 50)),
          title: Text(
            userData.name,
            style: context.textTheme.headline6!.copyWith(
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            userData.mobile,
            style: const TextStyle(color: primaryColor),
          ),
          trailing: GestureDetector(
            onTap: () {
              ref.read(authProvider).logoutUser();
              context.pushReplacment(const LoginView());
            },
            child: SvgPicture.asset(logoutIcon),
          ),
        ),
      ),
    );
  }
}
