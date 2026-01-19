import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/widgets/app_tab_bar.dart';
import 'package:fitness_app/features/exercise/presentation/view_model/cubit/exercise_cubit.dart';
import 'package:fitness_app/features/exercise/presentation/views/widgets/cal_and_time_section.dart';
import 'package:fitness_app/features/workOuts/data/models/response/get_all_muscles_by_muscle_group_id_reponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ExerciseDetailsSection extends StatefulWidget {
  const ExerciseDetailsSection({super.key, required this.muscle});
  final MusclesBean muscle;
  // final Exercise exercise;
  @override
  State<ExerciseDetailsSection> createState() => _ExerciseDetailsSectionState();
}

class _ExerciseDetailsSectionState extends State<ExerciseDetailsSection> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExerciseCubit>();
    if (cubit.levels.isEmpty) {
      return const SizedBox.shrink(); // or a loading indicator
    }
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
          child: CachedNetworkImage(
            placeholder: (context, url) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.mainRed),
              );
            },
            imageUrl: widget.muscle.image ?? '',
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
              colors: [Color(0xff00000000), AppColors.neutral90],
            ),

            boxShadow: [
              BoxShadow(
                color: const Color(0xFF000000).withValues(alpha: 0.2),
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
              Text(
                widget.muscle.name ?? '',
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
                height: 50,
                child: AppTabBar(
                  controller: cubit.tabController,
                  tabs:
                      cubit.levels
                          .map((level) => Tab(text: level.name ?? ''))
                          .toList(),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 40,
          left: 16,
          child: IconButton(
            onPressed: () {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pop();
              });
            },
            icon: SvgPicture.asset(AppAssets.backIcon),
          ),
        ),
      ],
    );
  }
}
