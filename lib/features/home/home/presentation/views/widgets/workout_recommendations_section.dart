import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/features/home/home/presentation/view_model/cubit/home_view_cubit.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/workout_recommendation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';

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
              return Skeletonizer(
                enabled: true,
                effect: const ShimmerEffect(
                  baseColor: AppColors.neutral90With50Opacity,
                  highlightColor: AppColors.neutral70,
                ),
                child: SizedBox(
                  height: 104,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3, // Show 3 skeleton items
                    itemBuilder: (context, index) {
                      return Container(
                        height: 110,
                        width: 110,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          color: AppColors.neutral90With50Opacity,
                          borderRadius: BorderRadius.circular(25),
                        ),
                      );
                    },
                  ),
                ),
              );
            } else if (state.workoutRecommendationsStatus.isSuccess) {
              return WorkoutRecommendation(
                exercises: state.workoutRecommendations,
              );
            } else if (state.workoutRecommendationsStatus.isFailure) {
              return Center(
                child: Text(
                  state.workoutRecommendationsError ?? loc.unknownError,
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
