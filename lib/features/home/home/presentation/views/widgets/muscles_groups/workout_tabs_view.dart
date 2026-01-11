import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/widgets/app_tab_bar.dart';
import 'package:fitness_app/features/home/home/presentation/view_model/cubit/home_view_cubit.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/common/error_state_widget.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/muscles_groups/upcoming_workout_item.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/muscles_groups/workouts_list_skeleton.dart';
import 'package:fitness_app/features/workOuts/data/models/response/get_all_muscles_groups_reponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Workout tabs view displaying muscle group tabs with exercises
class WorkoutTabsView extends StatefulWidget {
  final List<MusclesGroupBean> musclesGroups;

  const WorkoutTabsView({super.key, required this.musclesGroups});

  @override
  State<WorkoutTabsView> createState() => _WorkoutTabsViewState();
}

class _WorkoutTabsViewState extends State<WorkoutTabsView>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    if (widget.musclesGroups.isNotEmpty) {
      _initTabController();
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.musclesGroups.isEmpty) {
      return const ErrorStateWidget(message: "No data available", height: 90);
    }

    return BlocBuilder<HomeViewCubit, HomeViewState>(
      buildWhen:
          (previous, current) =>
              previous.workoutsByMuscleGroupStatus !=
                  current.workoutsByMuscleGroupStatus ||
              previous.workoutsByMuscleGroup != current.workoutsByMuscleGroup,
      builder: (context, state) {
        return Column(
          children: [
            AppTabBar(
              tabs:
                  widget.musclesGroups
                      .map((item) => Tab(text: item.name ?? ''))
                      .toList(),
              controller: _tabController,
            ),
            const SizedBox(height: 8),
            if (state.workoutsByMuscleGroupStatus.isLoading)
              const WorkoutsListSkeleton()
            else if (state.workoutsByMuscleGroupStatus.isSuccess &&
                state.workoutsByMuscleGroup.isNotEmpty)
              SizedBox(
                height: 90,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.workoutsByMuscleGroup.length,
                  itemBuilder: (context, index) {
                    final workout = state.workoutsByMuscleGroup[index];
                    return HomeUpcomingWorkoutItem(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RoutesName.exerciseView,
                          arguments: workout,
                        );
                      },
                      name: workout.name ?? "Exercise Name Not Found",
                      image: workout.image ?? "Image Not Found",
                      muscle: workout,
                    );
                  },
                ),
              )
            else if (state.workoutsByMuscleGroupStatus.isFailure)
              ErrorStateWidget(
                message:
                    state.workoutsByMuscleGroupError ?? "Unable to get muscles",
                height: 90,
              )
            else
              const SizedBox(height: 90),
          ],
        );
      },
    );
  }

  void _initTabController() {
    _tabController = TabController(
      length: widget.musclesGroups.length,
      vsync: this,
    );
    _tabController.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    if (!_tabController.indexIsChanging) {
      final homeCubit = context.read<HomeViewCubit>();
      final id = widget.musclesGroups[_tabController.index].id;
      if (id != null) {
        homeCubit.doIntent(GetWorkoutsByMuscleGroupIdIntent(id: id));
      }
    }
  }
}
