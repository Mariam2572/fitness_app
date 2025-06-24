import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTabBar extends StatelessWidget {
  final List<Widget> tabs;
  // final List<Widget> tabViews;
  final TabController controller;

  const AppTabBar({
    super.key,
    required this.tabs,
    // required this.tabViews,
    required this.controller,
  }) ;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      labelColor: AppColors.baseWhite,
      unselectedLabelColor: AppColors.baseWhite,
      indicatorSize: TabBarIndicatorSize.tab,
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      dividerColor: Colors.transparent,
      indicatorPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      indicator: BoxDecoration(
        color: AppColors.mainRed,
        borderRadius: BorderRadius.circular(25),
      ),
      tabs: tabs
    );
  }
}
