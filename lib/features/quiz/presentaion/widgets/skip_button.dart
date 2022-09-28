import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/widgets/bounce_animation.dart';

class SkipButton extends ConsumerWidget {
  const SkipButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final Function() onTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSkipped = ref.watch(skipStateProvider);
    return isSkipped
        ? const SizedBox(
            height: 50,
          )
        : InkWell(
            onTap: onTap,
            child: BounceAnimation(
              child: Container(
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(18),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Skip",
                      style: context.textTheme.titleMedium,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}

final skipStateProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});
