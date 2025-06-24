import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/widgets/custom_glass_container.dart';
import 'package:fitness_app/features/exercise/presentation/view_model/cubit/exercise_cubit.dart';
import 'package:fitness_app/features/exercise/presentation/views/widgets/exercise_details_section.dart';
import 'package:fitness_app/features/exercise/presentation/views/widgets/exercise_widget_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseViewBody extends StatefulWidget {
  const ExerciseViewBody({super.key});

  @override
  State<ExerciseViewBody> createState() => _ExerciseViewBodyState();
}

class _ExerciseViewBodyState extends State<ExerciseViewBody>
    with TickerProviderStateMixin {
  @override
  @override
  void initState() {
    super.initState();
    final cubit = context.read<ExerciseCubit>();
    cubit
        .doIntent(
          GetLevelsByPrimeMoverMusclesIntent(
            primeMoverMuscleId: "67c8499726895f87ce0aa9bc",
          ),
        )
        .then((value) {
          if (cubit.levels.isNotEmpty) {
            cubit.tabController = TabController(
              length: cubit.levels.length,
              vsync: this,
            );
            final firstId = cubit.levels[0].id;
            cubit.doIntent(
              GetExerciseByMoverAndDifficulty(
                primeMoverMuscleId: '67c8499726895f87ce0aa9bc',
                difficultyLevelId: firstId ?? '',
              ),
            );
            cubit.tabController.addListener(() {
              if (!cubit.tabController.indexIsChanging) {
                final id = cubit.levels[cubit.tabController.index].id;
                cubit.doIntent(
                  GetExerciseByMoverAndDifficulty(
                    primeMoverMuscleId: '67c8499726895f87ce0aa9bc',
                    difficultyLevelId: id ?? '',
                  ),
                );
              }
            });
          }
        });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    final cubit = context.read<ExerciseCubit>();
    cubit.tabController.dispose();
    cubit.tabController.removeListener(() {});
    super.dispose();
  }

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
          BlocBuilder<ExerciseCubit, ExerciseState>(
            buildWhen:
                (previous, current) =>
                    previous != current && current is ExerciseSuccess,

            builder: (context, state) {
              if (state is ExerciseSuccess) {
                final exercises =
                    state
                        .exerciseByPrimeMoverAndDifficultyResponse
                        ?.exercises ??
                    [];

                return Column(
                  children: [
                    const ExerciseDetailsSection(),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: CustomGlassContainer(
                        child: ListView.separated(
                          itemBuilder: (BuildContext context, int index) {
                            return ExerciseWidgetItem(
                              exercise: exercises[index],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider(
                              color: AppColors.neutral50,
                              thickness: .5,
                            );
                          },
                          itemCount: exercises.length,
                        ),
                      ),
                    ),
                  ],
                );
              } else if (state is ExerciseFailuer) {
                return Text(state.message);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
