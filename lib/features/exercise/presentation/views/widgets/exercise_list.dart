import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/widgets/custom_glass_container.dart';
import 'package:fitness_app/features/exercise/data/models/exercise_by_prime_mover_and_difficulty_model/exercise.dart';
import 'package:fitness_app/features/exercise/presentation/views/widgets/exercise_widget_item.dart';
import 'package:flutter/material.dart';
class ExerciseList extends StatelessWidget {
  const ExerciseList({super.key, required this.exerciseList});
  final List<Exercise> exerciseList;
  @override
  Widget build(BuildContext context) {
    return CustomGlassContainer(
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ExerciseWidgetItem(
            exercise:
               exerciseList[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(color: AppColors.neutral50, thickness: .5);
        },
        itemCount: exerciseList.length,
      ),
    );
  }
}