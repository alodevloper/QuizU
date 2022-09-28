import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../../data/models/tab_model.dart';
import '../../providers/home_provider_state.dart';
import '../widgets/widgets.dart';

class MainLayout extends ConsumerWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIdex = ref.watch(homeStateProvider);
    return Scaffold(
        extendBody: true,
        backgroundColor: pageIdex == 2 ? primaryColor : Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            TabModel.tabItems[pageIdex].title,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TabModel.tabItems[pageIdex].screen,
        ),
        bottomNavigationBar: const QuizUBottomNavigationBar());
  }
}
