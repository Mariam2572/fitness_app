import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/home/home/presentation/view_model/cubit/home_view_cubit.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/workout_exercise_in_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// Section widget for displaying muscles groups/upcoming workouts
class MusclesGroupsSection extends StatefulWidget {
  const MusclesGroupsSection({super.key});

  @override
  State<MusclesGroupsSection> createState() => _MusclesGroupsSectionState();
}

class _MusclesGroupsSectionState extends State<MusclesGroupsSection> {
  bool _hasLoadedInitialTab = false;

  @override
  Widget build(BuildContext context) {
    final loc = context.loc;
    final text = context.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                loc.upcomingWorkouts,
                style: text.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.workouts);
              },
              child: Text(
                loc.seeAll,
                style: text.bodyLarge?.copyWith(color: AppColors.mainRed),
              ),
            ),
          ],
        ),
        BlocConsumer<HomeViewCubit, HomeViewState>(
          listenWhen:
              (previous, current) =>
                  previous.musclesGroupsStatus != current.musclesGroupsStatus &&
                  current.musclesGroupsStatus.isSuccess,
          listener: (context, state) {
            // When muscles groups load successfully, load the first tab's workouts
            if (!_hasLoadedInitialTab &&
                state.musclesGroups?.musclesGroup != null &&
                state.musclesGroups!.musclesGroup!.isNotEmpty) {
              _hasLoadedInitialTab = true;
              final firstGroupId = state.musclesGroups!.musclesGroup!.first.id;
              if (firstGroupId != null) {
                context.read<HomeViewCubit>().doIntent(
                  GetWorkoutsByMuscleGroupIdIntent(id: firstGroupId),
                );
              }
            }
          },
          buildWhen:
              (previous, current) =>
                  previous.musclesGroupsStatus != current.musclesGroupsStatus ||
                  previous.musclesGroups != current.musclesGroups,
          builder: (context, state) {
            if (state.musclesGroupsStatus.isLoading) {
              return Skeletonizer(
                enabled: true,
                effect: const ShimmerEffect(
                  baseColor: AppColors.neutral90With50Opacity,
                  highlightColor: AppColors.neutral70,
                ),
                child: Column(
                  children: [
                    // Skeleton for tabs
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.neutral90With50Opacity,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Skeleton for workout items
                    SizedBox(
                      height: 90,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
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
                  ],
                ),
              );
            } else if (state.musclesGroupsStatus.isSuccess) {
              return WorkoutExerciseInHomeView(
                musclesCroup: state.musclesGroups?.musclesGroup ?? [],
              );
            } else if (state.musclesGroupsStatus.isFailure) {
              return Center(
                child: Text(state.musclesGroupsError ?? loc.unknownError),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
