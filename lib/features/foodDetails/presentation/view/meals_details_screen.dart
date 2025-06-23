import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:fitness_app/features/foodDetails/data/model/meals_datails_response/meal.dart';
import 'package:fitness_app/features/foodDetails/domain/usecases/meals_details_usecase.dart';
import 'package:fitness_app/features/foodDetails/presentation/view/widgets/ingrediant_column.dart';
import 'package:fitness_app/features/foodDetails/presentation/view/widgets/nutrient_box_widget.dart';
import 'package:fitness_app/features/foodDetails/presentation/view/widgets/recommendation_card.dart';
import 'package:fitness_app/features/foodDetails/presentation/view_model/meals_details_cubit.dart';
import 'package:fitness_app/features/foodDetails/presentation/view_model/meals_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MealsDetailsScreen extends StatelessWidget {
  const MealsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final mealId = ModalRoute.of(context)!.settings.arguments as String;

    return BlocProvider(
      create: (_) => MealsDetailsCubit(getIt.get<MealsDetailsUsecase>())
        ..doIntent(PerformMealsDetails(id: '52978')),
      child: const _MealsDetailsBody(),
    );
  }
}

class _MealsDetailsBody extends StatelessWidget {
  const _MealsDetailsBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/auth_background.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          SafeArea(
            child: BlocBuilder<MealsDetailsCubit, MealsDetailsState>(
              builder: (context, state) {
                if (state is MealsDetailsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(color: AppColors.mainRed),
                  );
                }

                Meal? meal;
                String? errorMessage;
                if (state is MealsDetailsSuccess) {
                  meal = state.response.meals?.first;
                } else if (state is MealsDetailsFailure) {
                  errorMessage = state.error;
                }

                return SingleChildScrollView(

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      MealHeader(meal: meal),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(

                          children: [
                            const SizedBox(height: 16),
                            IngredientsSection(meal: meal),
                            const SizedBox(height: 16),
                            const RecommendationsSection(),
                            if (errorMessage != null) ...[
                              const SizedBox(height: 16),
                              Text(
                                '$errorMessage',
                                style: const TextStyle(color: Colors.redAccent),
                              ),
                            ]
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MealHeader extends StatelessWidget {
  final Meal? meal;

  const MealHeader({required this.meal});

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/auth_background.png"),
                fit: BoxFit.fill,

              ),
            ),
          ),
        ),

          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 340,
            child: Image.network(
              meal?.strMealThumb ?? '',
              fit: BoxFit.cover,
            ),
          ),


        Positioned(
          top: 16,
          left: 16,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Image.asset("assets/images/Back.png", scale: 4),
          ),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                meal?.strMeal ?? 'Unknown Meal',
                style: AppTextStyle.instance.textStyle24.copyWith(
                  color: AppColors.baseWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                meal?.strInstructions ??
                    'Could not load meal description.',
                style: AppTextStyle.instance.textStyle16.copyWith(
                  color: AppColors.baseWhite,

                ),
                maxLines: 2,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  NutrientBoxWidget(value: '100 K', label: 'Energy'),
                  NutrientBoxWidget(value: '15 G', label: 'Protein'),
                  NutrientBoxWidget(value: '58 G', label: 'Carbs'),
                  NutrientBoxWidget(value: '20 G', label: 'Fat'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
class RecommendationsSection extends StatelessWidget {
  const RecommendationsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommendation',
          style: AppTextStyle.instance.textStyle20.copyWith(
            color: AppColors.baseWhite,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 18),
        Row(
          children: [
            Expanded(
              child: RecommendationCard(
                imagePath: 'assets/images/test image.png',
                label: "Pasta with chicks",
              ),
            ),
            const SizedBox(width: 12),
             Expanded(
               child: RecommendationCard(
                imagePath: 'assets/images/pasta image.png',
                label: "",
                           ),
             ),
          ],
        ),
      ],
    );
  }
}

class IngredientsSection extends StatelessWidget {
  final Meal? meal;

  const IngredientsSection({required this.meal});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ingredients',
          style: AppTextStyle.instance.textStyle20.copyWith(
            color: AppColors.baseWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2D2D2D),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(8),
          child: meal != null
              ? IngredientColumn(meal: meal?? Meal())
              : const Text(
            'No ingredients available.',
            style: TextStyle(color: Colors.white70),
          ),
        ),
      ],
    );
  }
}
