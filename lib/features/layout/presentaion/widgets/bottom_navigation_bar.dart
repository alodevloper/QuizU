import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_colors.dart';
import '../../data/models/tab_model.dart';
import '../../providers/home_provider_state.dart';

class QuizUBottomNavigationBar extends ConsumerWidget {
  const QuizUBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(homeStateProvider);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      margin: const EdgeInsets.symmetric(horizontal: 20) +
          const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: pageIndex == 2 ? Colors.white : primaryColor,
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (var i = 0; i < TabModel.tabItems.length; i++)
            Expanded(
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  ref.read(homeStateProvider.notifier).update((state) => i);
                },
                child: SvgPicture.asset(
                  TabModel.tabItems[i].icon,
                  width: 24,
                  color: pageIndex == i
                      ? pageIndex == 2
                          ? primaryColor
                          : Colors.white
                      : Colors.grey,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
