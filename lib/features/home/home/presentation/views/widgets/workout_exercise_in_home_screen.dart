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
  @override
  void initState() {
    final homeCubit = context.read<HomeViewCubit>();
    if (homeCubit.musclesGroupCat.isNotEmpty) {
      homeCubit.tabController = TabController(
        length: homeCubit.musclesGroupCat.length,
        vsync: this,
      );
      final firstId = homeCubit.musclesGroupCat[0].id;
      homeCubit.doIntent(GetMusclesByMuscleGroupIdIntent(id: firstId ?? ""));
      homeCubit.tabController.addListener(() {
        if (!homeCubit.tabController.indexIsChanging) {
          final id =
              homeCubit.musclesGroupCat[homeCubit.tabController.index].id;
          homeCubit.doIntent(GetMusclesByMuscleGroupIdIntent(id: id ?? ""));
        }
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final workoutExercise = context.watch<HomeViewCubit>().workoutByMuscles;
    return Column(
      children: [
        AppTabBar(
          tabs:
              widget.musclesCroup
                  .map((item) => Tab(text: item.name ?? ''))
                  .toList(),
          controller: context.read<HomeViewCubit>().tabController,
        ),
        SizedBox(
          height: 90,

          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: workoutExercise != null ? workoutExercise.length : 0,

            itemBuilder: (context, index) {
              return HomeUpcomingWorkoutItem(
                name:
                    workoutExercise?[index].name ??
                    "Exercise Name Not Found",
                image:
                    workoutExercise?[index].image ??
                    "Image Not Found",
                // getYouTubeThumbnail(
                //   exercises[index].shortYoutubeDemonstrationLink ?? '',
                // ) ??
                // "https://img.youtube.com/vi/DEFAULT_THUMBNAIL/hqdefault.jpg",
              );
            },
          ),
        ),
      ],
    );
  }
}
