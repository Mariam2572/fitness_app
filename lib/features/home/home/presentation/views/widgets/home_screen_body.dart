import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/home/home/presentation/view_model/cubit/home_view_cubit.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/CategoryView.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/meal_recommendation.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/popular_training_cards.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/upcoming_workout.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/upcoming_workouts_category.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/workout_exercise_in_home_screen.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/workout_recommendation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = context.loc;
    final text = context.textTheme;

    return Stack(
      children: [
        Image.asset(
          AppAssets.homeBackground,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        SafeArea(
          child: BlocConsumer<HomeViewCubit, HomeViewState>(
            listener: (BuildContext context, HomeViewState state) {},
            buildWhen: (previous, current) => 
                previous != current && current is HomeViewSuccess,
            builder: (context, state) {
              final isLoading = state is HomeViewLoading;

              return Skeletonizer(
                enabled: isLoading,
                effect: const ShimmerEffect(
                  baseColor: AppColors.neutral90With50Opacity,
                  highlightColor: AppColors.neutral70,
                ),
                child: SingleChildScrollView(
                  padding: REdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (state is HomeViewSuccess)
                            Text(
                              "${loc.hi} ${state.userName},\n${loc.letsStartYourDay}",
                              style: text.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          else if (state is HomeViewError)
                            Center(
                              child: Text(
                                state.userNameError ?? loc.unableToGetUserName,
                              ),
                            )
                          else
                            Text(
                              "${loc.hi} User,\n${loc.letsStartYourDay}",
                              style: text.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            
                           if (state is HomeViewSuccess)
                           CircleAvatar(
                            radius: 24,
                            backgroundImage: CachedNetworkImageProvider(state.userImage??"")
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      Text(
                        loc.category,
                        style: text.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Category(),

                      const SizedBox(height: 24),

                      Text(
                        loc.recommendationsToday,
                        style: text.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),

                      if (state is HomeViewSuccess)
                        WorkoutRecommendation(exercises: state.exercises ?? []),
                      if (state is HomeViewError)
                        Center(
                          child: Text(
                            state.randomExercisesError ?? loc.unknownError,
                          ),
                        ),
                      const SizedBox(height: 24),

                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              loc.upcomingWorkouts,
                              style: text.bodyLarge?.copyWith(
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
                              style: text.bodyLarge?.copyWith(
                                color: AppColors.mainRed,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (state is HomeViewSuccess)
                        WorkoutExerciseInHomeView(musclesCroup: state.musclesGroups?.musclesGroup ?? []),
                        
                     
                      const SizedBox(height: 24),

                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              loc.recommendationsForYou,
                              style: text.bodyLarge?.copyWith(
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
                              style: text.bodyLarge?.copyWith(
                                color: AppColors.mainRed,
                              ),
                            ),
                          ),
                        ],
                      ),

                      if (state is HomeViewSuccess)
                        MealRecommendation(
                          mealCategories: state.mealsCategories ?? [],
                        ),
                      if (state is HomeViewError)
                        Center(
                          child: Text(
                            state.mealsCategoriesError ?? loc.unknownError,
                          ),
                        ),

                      const SizedBox(height: 24),

                      Text(
                        loc.popularTraining,
                        style: text.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const PopularTraining(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
