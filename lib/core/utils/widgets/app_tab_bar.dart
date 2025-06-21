import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTabBar extends StatelessWidget {
  final List<String> tabs;
  final List<Widget> tabViews;
  final TabController? controller; // Optional external controller

  const AppTabBar({
    super.key,
    required this.tabs,
    required this.tabViews,
    this.controller,
  }) : assert(tabs.length == tabViews.length, 'Tabs and Views must be same length');

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: TabBar(
              controller: controller,
              labelColor: AppColors.baseWhite,
              unselectedLabelColor: AppColors.baseWhite,

              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor:Colors.transparent,
              indicator: BoxDecoration(
                color: AppColors.mainRed,
                borderRadius: BorderRadius.circular(24),
              ),
              tabs: tabs.map((title) => Tab(text: title)).toList(),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: tabViews,
            ),
          ),
        ],
      ),
    );
  }
}
