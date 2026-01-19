import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/widgets/app_tab_bar.dart';
import 'package:fitness_app/features/home/home/presentation/view_model/cubit/home_view_cubit.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/home_upcoming_workout_item.dart';
import 'package:fitness_app/features/workOuts/data/models/response/get_all_muscles_groups_reponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WorkoutExerciseInHomeView extends StatefulWidget {
  final List<MusclesGroupBean> musclesCroup;

  const WorkoutExerciseInHomeView({super.key, required this.musclesCroup});

  @override
  State<WorkoutExerciseInHomeView> createState() =>
      _BodyPartsFilterWidgetState();
}

class _BodyPartsFilterWidgetState extends State<WorkoutExerciseInHomeView>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    if (widget.musclesCroup.isNotEmpty) {
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
    if (widget.musclesCroup.isEmpty) {
      return Center(
        child: Text("No data available", style: context.textTheme.bodyMedium),
      );
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
                  widget.musclesCroup
                      .map((item) => Tab(text: item.name ?? ''))
                      .toList(),
              controller: _tabController,
            ),
            const SizedBox(height: 8),
            if (state.workoutsByMuscleGroupStatus.isLoading)
              Skeletonizer(
                enabled: true,
                effect: const ShimmerEffect(
                  baseColor: AppColors.neutral90,
                  highlightColor: AppColors.neutral70,
                ),
                child: SizedBox(
                  height: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4, // Show 4 skeleton items
                    itemBuilder: (context, index) {
                      return Container(
                        width: 90,
                        margin: const EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          color: AppColors.neutral90With50Opacity,
                          borderRadius: BorderRadius.circular(25),
                        ),
                      );
                    },
                  ),
                ),
              )
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
              SizedBox(
                height: 90,
                child: Center(
                  child: Text(
                    state.workoutsByMuscleGroupError ?? "Unable to get muscles",
                    style: context.textTheme.bodyMedium,
                  ),
                ),
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
      length: widget.musclesCroup.length,
      vsync: this,
    );
    _tabController.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    if (!_tabController.indexIsChanging) {
      final homeCubit = context.read<HomeViewCubit>();
      final id = widget.musclesCroup[_tabController.index].id;
      if (id != null) {
        homeCubit.doIntent(GetWorkoutsByMuscleGroupIdIntent(id: id));
      }
    }
  }
}
