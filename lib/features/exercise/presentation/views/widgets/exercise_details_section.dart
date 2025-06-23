import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/widgets/app_tab_bar.dart';
import 'package:fitness_app/features/exercise/data/models/exercise_by_prime_mover_and_difficulty_model/exercise.dart';
import 'package:fitness_app/features/exercise/data/models/levels_by_muscles_model.dart';
import 'package:fitness_app/features/exercise/presentation/view_model/cubit/exercise_cubit.dart';
import 'package:fitness_app/features/exercise/presentation/views/widgets/cal_and_time_section.dart';
import 'package:flutter_svg/svg.dart';

class ExerciseDetailsSection extends StatefulWidget {
  final LevelsByMusclesModel? levelsByMusclesModel;

  const ExerciseDetailsSection({super.key, this.levelsByMusclesModel});

  @override
  State<ExerciseDetailsSection> createState() => _ExerciseDetailsSectionState();
}

class _ExerciseDetailsSectionState extends State<ExerciseDetailsSection>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.levelsByMusclesModel!.difficultyLevels!.length,
      vsync: this,
    );

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) return;

      context.read<ExerciseCubit>().doIntent(
        GetLevelsByPrimeMoverMusclesIntent("67c797e226895f87ce0aa94b"),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
          child: Image.asset(
            AppAssets.exercise,
            fit: BoxFit.cover,
            width: double.infinity,
            height: context.height * 0.5,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          height: context.height * 0.50,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff00000000), Color(0xFF242424)],
            ),

            boxShadow: [
              BoxShadow(
                color: const Color(0xFF000000).withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // IconButton(
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              //   icon: SvgPicture.asset(AppAssets.backIcon),
              // ),
                    
              Text(
                'Chest Exercise',
                style: context.textTheme.headlineMedium?.copyWith(
                  color: AppColors.baseWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Lorem Ipsum Dolor Sit Amet Consectetur. Tempus Volutpat Ut Nisi Morbi.',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.baseWhite,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              const CalAndTimeSection(),
              const SizedBox(height: 16),
                    
              SizedBox(
                height: context.height * 0.05,
                child: AppTabBar(
                  controller: _tabController,
                  tabs:
                      widget.levelsByMusclesModel?.difficultyLevels!
                          .map((e) => e.name ?? '')
                          .toList() ??
                      [],
                  tabViews:
                      widget.levelsByMusclesModel?.difficultyLevels!
                          .map(
                            (e) => Center(
                              child: Text(
                                e.name ?? '',
                                style: context.textTheme.bodySmall
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                            ),
                          )
                          .toList() ??
                      [],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
