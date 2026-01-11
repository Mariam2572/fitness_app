import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/features/home/home/presentation/view_model/cubit/home_view_cubit.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/common/error_state_widget.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/workout_recommendations/workout_recommendation_list.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/workout_recommendations/workout_skeleton_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Section widget for displaying workout recommendations
class WorkoutRecommendationsSection extends StatelessWidget {
  const WorkoutRecommendationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = context.loc;
    final text = context.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          loc.recommendationsToday,
          style: text.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        BlocBuilder<HomeViewCubit, HomeViewState>(
          buildWhen:
              (previous, current) =>
                  previous.workoutRecommendationsStatus !=
                      current.workoutRecommendationsStatus ||
                  previous.workoutRecommendations !=
                      current.workoutRecommendations,
          builder: (context, state) {
            if (state.workoutRecommendationsStatus.isLoading) {
              return const WorkoutSkeletonLoader();
            } else if (state.workoutRecommendationsStatus.isSuccess) {
              return WorkoutRecommendation(
                exercises: state.workoutRecommendations,
              );
            } else if (state.workoutRecommendationsStatus.isFailure) {
              return ErrorStateWidget(
                message: state.workoutRecommendationsError ?? loc.unknownError,
                height: 104,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
