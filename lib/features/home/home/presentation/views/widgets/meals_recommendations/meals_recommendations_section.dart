import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/features/home/home/presentation/view_model/cubit/home_view_cubit.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/common/error_state_widget.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/common/section_header.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/meals_recommendations/meal_recommendation_list.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/meals_recommendations/meals_skeleton_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Section widget for displaying meals recommendations
class MealsRecommendationsSection extends StatelessWidget {
  const MealsRecommendationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = context.loc;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: loc.recommendationsForYou,
          seeAllText: loc.seeAll,
          onSeeAllTap: () {
            Navigator.pushNamed(context, RoutesName.food);
          },
        ),
        BlocBuilder<HomeViewCubit, HomeViewState>(
          buildWhen:
              (previous, current) =>
                  previous.mealsCategoriesStatus !=
                      current.mealsCategoriesStatus ||
                  previous.mealsCategories != current.mealsCategories,
          builder: (context, state) {
            if (state.mealsCategoriesStatus.isLoading) {
              return const MealsSkeletonLoader();
            } else if (state.mealsCategoriesStatus.isSuccess) {
              return MealRecommendation(mealCategories: state.mealsCategories);
            } else if (state.mealsCategoriesStatus.isFailure) {
              return ErrorStateWidget(
                message: state.mealsCategoriesError ?? loc.unknownError,
                height: 104,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
