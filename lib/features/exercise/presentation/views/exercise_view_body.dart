import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/widgets/custom_glass_container.dart';
import 'package:fitness_app/features/exercise/presentation/view_model/cubit/exercise_cubit.dart';
import 'package:fitness_app/features/exercise/presentation/views/widgets/exercise_details_section.dart';
import 'package:fitness_app/features/exercise/presentation/views/widgets/exercise_widget_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ExerciseViewBody extends StatefulWidget {
  const ExerciseViewBody({super.key});

  @override
  State<ExerciseViewBody> createState() => _ExerciseViewBodyState();
}

class _ExerciseViewBodyState extends State<ExerciseViewBody> {
  @override
  initState() {
    super.initState();
    // context.read<ExerciseCubit>().doIntent(
    //   GetLevelsByPrimeMoverMusclesIntent("67c8499726895f87ce0aa9bc"),
    // );
    context.read<ExerciseCubit>().doIntent(
      GetExerciseByMoverAndDifficulty(
        primeMoverMuscleId: "67c8499726895f87ce0aa9bc",
        difficultyLevelId: "67c797e226895f87ce0aa94b",
      ),
    );
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
            buildWhen: (previous, current) => previous != current&& current is ExerciseSuccess,
            builder: (context, state) {
              if (state is ExerciseSuccess) {
                return Column(
                  children: [
                    ExerciseDetailsSection(
                      levelsByMusclesModel: state.levelsByMusclesModel,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: CustomGlassContainer(
                        child: ListView.separated(
                          itemBuilder: (BuildContext context, int index) {
                            return ExerciseWidgetItem(
                              exercise:
                                  state
                                      .exerciseByPrimeMoverAndDifficultyResponse!
                                      .exercises![index],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider(
                              color: AppColors.neutral50,
                              thickness: .5,
                            );
                          },
                          itemCount: 5,
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
    ;
  }
}
