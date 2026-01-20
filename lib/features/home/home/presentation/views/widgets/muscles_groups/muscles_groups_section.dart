import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/features/home/home/presentation/view_model/cubit/home_view_cubit.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/common/error_state_widget.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/common/section_header.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/muscles_groups/muscles_groups_skeleton.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/muscles_groups/workout_tabs_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: loc.upcomingWorkouts,
          seeAllText: loc.seeAll,
          onSeeAllTap: () {
            Navigator.pushNamed(context, RoutesName.workouts);
          },
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
              return const MusclesGroupsSkeleton();
            } else if (state.musclesGroupsStatus.isSuccess) {
              return WorkoutTabsView(
                musclesGroups: state.musclesGroups?.musclesGroup ?? [],
              );
            } else if (state.musclesGroupsStatus.isFailure) {
              return ErrorStateWidget(
                message: state.musclesGroupsError ?? loc.unknownError,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
