import 'dart:ui';

import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/home/home/presentation/view_model/home_state.dart';
import 'package:fitness_app/features/home/home/presentation/view_model/home_viewModel.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/CategoryView.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/meal_recommendation.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/popular_training_cards.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/upcoming_workout.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/upcoming_workouts_category.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/workout_recommendation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

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
          child: BlocBuilder<HomeViewModel, HomeState>(
            builder: (context, state) {
              final isLoading = state is HomeLoading;
              
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
                          if (state is HomeSuccess)
                            Text(
                              "Hi ${state.userName},\nLet's Start Your Day",
                              style: text.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          else
                            Text(
                              "Hi User,\nLet's Start Your Day",
                              style: text.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          const CircleAvatar(
                            radius: 24,
                            backgroundImage:
                                AssetImage("assets/images/user.png"),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                     
                      Text(
                        loc.category,
                        style: text.bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                       Category(),

                      const SizedBox(height: 24),

                      
                      Text(
                        loc.recommendationsToday,
                        style: text.bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),

                      if (state is HomeSuccess)
                        WorkoutRecommendation(
                          exercises: state.exercises ?? [],
                        )
                      else if (state is HomeError)
                        Center(child: Text(state.message)),
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
                              Navigator.pushNamed(
                                  context, RoutesName.workouts);
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

                     
                     if (state is HomeSuccess)
                        UpcomingWorkoutsCategory(bodyParts: state.musclesGroups?.musclesGroup ??[], 
                         
                        )
                      else if (state is HomeError)
                        Center(child: Text(state.message)),
                     
                      const SizedBox(height: 8),
                      if (state is HomeSuccess)
                        UpcomingWorkout(
                          exercises: state.exercises ?? [],
                        )
                      else if (state is HomeError)
                        Center(child: Text(state.message)),
                      

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

                     
                      if (state is HomeSuccess)
                        MealRecommendation(
                          mealCategories: state.categories ?? [],
                        )
                      else if (state is HomeError)
                        Center(child: Text(state.message)),
                      // else
                      //   MealRecommendation(mealCategories: []),

                      const SizedBox(height: 24),

                      
                      Text(
                        loc.popularTraining,
                        style: text.bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
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

// class SkeletonizerDummyWidgetForHome extends StatelessWidget {
//   const SkeletonizerDummyWidgetForHome({super.key});

//   @override
// //   Widget build(BuildContext context) {
// //     return Row(
//       children: List.generate(
//         3,
//         (index) => Container(
//           height: 110,
//           width: 110,
//           margin: const EdgeInsets.only(right: 12),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Skeleton.replace(
//                 child: Container(
//                   height: 110,
//                   width: 110,
//                   decoration: BoxDecoration(
//                     color: AppColors.whiteSmoke,
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Skeleton.replace(
//                 child: Container(
//                   height: 35,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: AppColors.whiteSmoke,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
