import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/home/home/presentation/view_model/cubit/home_view_cubit.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/meal_recommendation.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/meals_recommendations/meal_recommendation_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// Section widget for displaying meals recommendations
class MealsRecommendationsSection extends StatelessWidget {
  const MealsRecommendationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = context.loc;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MealRecommendationTitle(),
        BlocBuilder<HomeViewCubit, HomeViewState>(
          buildWhen:
              (previous, current) =>
                  previous.mealsCategoriesStatus !=
                      current.mealsCategoriesStatus ||
                  previous.mealsCategories != current.mealsCategories,
          builder: (context, state) {
            if (state.mealsCategoriesStatus.isLoading) {
              return Skeletonizer(
                enabled: true,
                effect: const ShimmerEffect(
                  baseColor: AppColors.neutral90With50Opacity,
                  highlightColor: AppColors.neutral70,
                ),
                child: SizedBox(
                  height: 104,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3, // Show 3 skeleton items
                    itemBuilder: (context, index) {
                      return Container(
                        height: 110,
                        width: 110,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          color: AppColors.neutral90With50Opacity,
                          borderRadius: BorderRadius.circular(25),
                        ),
                      );
                    },
                  ),
                ),
              );
            } else if (state.mealsCategoriesStatus.isSuccess) {
              return MealRecommendation(mealCategories: state.mealsCategories);
            } else if (state.mealsCategoriesStatus.isFailure) {
              return Center(
                child: Text(state.mealsCategoriesError ?? loc.unknownError),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}

