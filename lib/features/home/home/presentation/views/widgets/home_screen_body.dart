import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/features/home/home/presentation/view_model/cubit/home_view_cubit.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/categories/categories_section.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/header/home_header_section.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/meals_recommendations/meals_recommendations_section.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/muscles_groups/muscles_groups_section.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/popular_training/popular_training_section.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/workout_recommendations/workout_recommendations_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Main home screen body composing all sections
class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.homeBackground,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),

        // Content
        RefreshIndicator(
          color: Colors.white,
          onRefresh: () async {
            context.read<HomeViewCubit>().doIntent(GetHomeDataIntent());
          },
          child: SafeArea(
            child: SingleChildScrollView(
              padding: REdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  HomeHeaderSection(),
              
                  SizedBox(height: 24),
              
                  // Categories Section
                  CategoriesSection(),
              
                  SizedBox(height: 24),
              
                  // Workout Recommendations Section
                  WorkoutRecommendationsSection(),
              
                  SizedBox(height: 24),
              
                  // Muscles Groups/Upcoming Workouts Section
                  MusclesGroupsSection(),
              
                  SizedBox(height: 24),
              
                  // Meals Recommendations Section
                  MealsRecommendationsSection(),
              
                  SizedBox(height: 24),
              
                  // Popular Training Section
                  PopularTrainingSection(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
