import 'package:flutter/cupertino.dart';
import 'package:quiz_okoul/features/profile/presentaion/views/profile_view.dart';
import 'package:quiz_okoul/features/scores/presentaion/views/leaderboard_view.dart';

import '../../../../core/constants/fixed_assets.dart';
import '../../../home/presentaion/views/home_view.dart';

class TabModel {
  TabModel({
    required this.title,
    required this.icon,
    required this.screen,
  });
  final String title;
  final String icon;
  final Widget screen;

  static final List<TabModel> tabItems = [
    TabModel(
      title: 'QuizU',
      icon: homeIcon,
      screen: const HomeView(),
    ),
    TabModel(
      title: 'Leaderboard',
      icon: leaderboardIcon,
      screen: const LeaderboardView(),
    ),
    TabModel(
      title: 'Profile',
      icon: profileIcon,
      screen: const ProfileView(),
    ),
  ];
}
