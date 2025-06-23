import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/widgets/custom_glass_container.dart';
import 'package:fitness_app/features/exercise/domain/use_cases/get_exercise_by_mover_and_difficulty_level.dart';
import 'package:fitness_app/features/exercise/domain/use_cases/get_levels_by_prime_mover_muscles.dart';
import 'package:fitness_app/features/exercise/presentation/view_model/cubit/exercise_cubit.dart';
import 'package:fitness_app/features/exercise/presentation/views/widgets/exercise_widget_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseView extends StatefulWidget {
  const ExerciseView({super.key});

  @override
  State<ExerciseView> createState() => _ExerciseViewState();
}

class _ExerciseViewState extends State<ExerciseView> {
  @override
  // void initState() {
  //   context.read<ExerciseCubit>().doIntent(
  //     GetExerciseByMoverAndDifficulty(
  //       primeMoverMuscleId: "67c8499726895f87ce0aa9bc",
  //       difficultyLevelId: "67c797e226895f87ce0aa94b",
  //     ),
  //   );
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.homeBackground,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomGlassContainer(
              child: ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        return const ExerciseWidgetItem();
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          color: AppColors.neutral50,
                          thickness: .5,
                        );
                      },
                      itemCount:
                        5,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
