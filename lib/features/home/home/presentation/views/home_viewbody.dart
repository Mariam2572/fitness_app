import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:fitness_app/features/home/home/presentation/view_model/home_state.dart';
import 'package:fitness_app/features/home/home/presentation/view_model/home_viewModel.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/CategoryView.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/meal_recommendation.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/popular_training_cards.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/upcoming_workout.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/upcoming_workouts_category.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/workout_recommendation.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/features/auth/register/presentation/widgets/blur_background.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = context.loc;
    final text = context.textTheme;
    List<String> categories = [
      "Full Body",
      "Chest",
      "Arm",
      "Shoulder",
      "Back",
      "Legs",
    ];

    return Stack(
      children: [
        Image.asset(
          AppAssets.homeBackground,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        SafeArea(
          child: SingleChildScrollView(
            padding: REdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<HomeViewModel, HomeState>(
                      builder: (context, state) {
                        if (state is HomeLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is HomeSuccess) {
                          return Text(
                            "Hi ${state.userName} ,\n Let's Start Your Day",
                            style: text.titleSmall?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        } else if (state is HomeError) {
                          return Center(child: Text('Error: ${state.message}'));
                        }
                        return const SizedBox.shrink();
                      },
                    ),

                    const CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage("assets/images/user.png"),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                Text(
                  loc.category,
                  style: text.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Category(),
                const SizedBox(height: 24),
                Text(
                  loc.recommendationsToday,
                  style: text.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                BlocBuilder<HomeViewModel, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is HomeError) {
                      return Center(child: Text(state.message));
                    } else if (state is HomeSuccess) {
                      return WorkoutRecommendation(
                        exercises: state.exercises ?? [],
                      );
                    }
                    return const Center(child: Text("Error happened"));
                  },
                ),

                Row(
                  children: [
                    Expanded(
                      child: Text(
                        loc.upcomingWorkouts,
                        style: AppTextStyle.instance.textStyle16.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesName.workouts);
                      },
                      child: Text(
                        loc.seeAll,
                        style: AppTextStyle.instance.textStyle16.copyWith(
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                  ],
                ),

                UpcomingWorkoutsCategory(bodyParts: categories),

                BlocBuilder<HomeViewModel, HomeState>(
                  builder: (context, state) {
                    if (state is HomeError) {
                      return Center(child: Text(state.message));
                    } else if (state is HomeLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is HomeSuccess) {
                      return UpcomingWorkout(
                        exercises: state.allExercises ?? [],
                      );
                    }
                    return const Center(child: Text("Error happened"));
                  },
                ),

                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        loc.recommendationsForYou,
                        style: AppTextStyle.instance.textStyle16.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesName.food);
                      },
                      child: Text(
                        loc.seeAll,
                        style: AppTextStyle.instance.textStyle16.copyWith(
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                  ],
                ),
                BlocBuilder<HomeViewModel, HomeState>(
                  builder: (context, state) {
                    if (state is HomeError) {
                      return Center(child: Text(state.message));
                    } else if (state is HomeLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is HomeSuccess) {
                      return MealRecommendation(
                        mealCategories: state.categories ?? [],
                      );
                    }
                    return const Center(child: Text("Error happened"));
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  loc.popularTraining,
                  style: AppTextStyle.instance.textStyle16.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const PopularTraining(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
