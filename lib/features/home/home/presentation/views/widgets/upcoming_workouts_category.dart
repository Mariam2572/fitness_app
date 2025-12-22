import 'package:fitness_app/core/utils/widgets/app_tab_bar.dart';
import 'package:fitness_app/features/workOuts/data/models/response/get_all_muscles_groups_reponse.dart';
import 'package:flutter/material.dart';

class UpcomingWorkoutsCategory extends StatefulWidget {
  final List<MusclesGroupBean> bodyParts;
  // final bool isLoading;

  const UpcomingWorkoutsCategory({
    super.key,
    required this.bodyParts,
    // required this.isLoading,
  });

  @override
  State<UpcomingWorkoutsCategory> createState() =>
      _BodyPartsFilterWidgetState();
}

class _BodyPartsFilterWidgetState extends State<UpcomingWorkoutsCategory>
    with TickerProviderStateMixin {
  // late String selectedBodyPart;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.bodyParts.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppTabBar(
      tabs: widget.bodyParts.map((item) => Tab(text: item.name ?? '')).toList(),
      controller: _tabController,
    );
  }
}
