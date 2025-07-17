import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/widgets/app_tab_bar.dart';
import 'package:fitness_app/features/home/home/presentation/view_model/cubit/home_view_cubit.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/home_upcoming_workout_item.dart';
import 'package:fitness_app/features/workOuts/data/models/response/get_all_muscles_groups_reponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class WorkoutExerciseInHomeView extends StatefulWidget {
  final List<MusclesGroupBean> musclesCroup;

  const WorkoutExerciseInHomeView({Key? key, required this.musclesCroup})
    : super(key: key);

  @override
  State<WorkoutExerciseInHomeView> createState() =>
      _BodyPartsFilterWidgetState();
}

class _BodyPartsFilterWidgetState extends State<WorkoutExerciseInHomeView>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    final homeCubit = context.read<HomeViewCubit>();
    homeCubit.doIntent(HomeViewDataIntent()).then((value) {
      if (homeCubit.musclesGroupCat.isNotEmpty) {
        _initTabController(homeCubit);
        handleApiCallWhenTabChanges(homeCubit);
      }
    });

    super.initState();
  }

  void handleApiCallWhenTabChanges(HomeViewCubit homeCubit) {
    final firstId = homeCubit.musclesGroupCat[0].id;
    homeCubit.doIntent(GetMusclesByMuscleGroupIdIntent(id: firstId ?? ""));
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        final id = homeCubit.musclesGroupCat[_tabController.index].id;
        homeCubit.doIntent(GetMusclesByMuscleGroupIdIntent(id: id ?? ""));
      }
    });
  }

  void _initTabController(HomeViewCubit homeCubit) {
    _tabController = TabController(
      length: homeCubit.musclesGroupCat.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewCubit, HomeViewState>(
      buildWhen:
          (previous, current) => current is GetMusclesByMuscleGroupIdSuccess,
      builder: (context, state) {
        if (state is GetMusclesByMuscleGroupIdSuccess) {
          return Column(
            children: [
              AppTabBar(
                tabs:
                    widget.musclesCroup
                        .map((item) => Tab(text: item.name ?? ''))
                        .toList(),
                controller: _tabController,
              ),
              SizedBox(
                height: 90,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.workoutsByMuscleGroupId?.length,

                  itemBuilder: (context, index) {
                    return HomeUpcomingWorkoutItem(
                      name:
                          state.workoutsByMuscleGroupId?[index].name ??
                          "Exercise Name Not Found",
                      image:
                          state.workoutsByMuscleGroupId?[index].image ??
                          "Image Not Found",
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is HomeViewError) {
          return Center(
            child: Text(
              state.musclesByMuscleGroupIdError ?? "Unable to get muscles",
              style: context.textTheme.bodyMedium,
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.mainRed),
          );
        }
      },
    );
  }
}
