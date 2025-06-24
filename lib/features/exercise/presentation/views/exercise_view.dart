import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/features/exercise/domain/use_cases/get_exercise_by_mover_and_difficulty_level.dart';
import 'package:fitness_app/features/exercise/domain/use_cases/get_levels_by_prime_mover_muscles.dart';
import 'package:fitness_app/features/exercise/presentation/view_model/cubit/exercise_cubit.dart';

import 'package:fitness_app/features/exercise/presentation/views/exercise_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseView extends StatelessWidget {
  const ExerciseView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExerciseCubit(
                getIt.get<GetLevelsByPrimeMoverMuscleUseCases>(),
                getIt.get<GetExerciseByMoverAndDifficultyLevelUseCase>(),
              ),
      child: const ExerciseViewBody(),
    );
  }
}
