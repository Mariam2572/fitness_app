import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/food/data/models/meals_of_category_response.dart';
import 'package:fitness_app/features/food/domain/usecases/get_food_categories_usecase.dart';
import 'package:fitness_app/features/food/domain/usecases/get_meals_of_category_usecase.dart';
import 'package:fitness_app/features/food/presentation/view%20model/food_cubit.dart';
import 'package:fitness_app/features/foodDetails/data/model/meals_datails_response/meal.dart';
import 'package:fitness_app/features/foodDetails/domain/usecases/meals_details_usecase.dart';
import 'package:fitness_app/features/foodDetails/presentation/view/widgets/ingredients_section.dart';
import 'package:fitness_app/features/foodDetails/presentation/view/widgets/meal_header.dart';
import 'package:fitness_app/features/foodDetails/presentation/view/widgets/recommendation_section.dart';
import 'package:fitness_app/features/foodDetails/presentation/view_model/meals_details_cubit.dart';
import 'package:fitness_app/features/foodDetails/presentation/view_model/meals_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealsDetailsScreen extends StatelessWidget {
  const MealsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final mealId = args['id'];
    final meals = args['meals'] as List<Meal>;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (_) =>
                  MealsDetailsCubit(getIt.get<MealsDetailsUsecase>())
                    ..doIntent(PerformMealsDetails(id: mealId)),
          child: _MealsDetailsBody(meals),
        ),
        BlocProvider(
          create:
              (_) => FoodCubit(
                getIt.get<GetFoodCategoriesUseCase>(),
                getIt.get<GetMealsByCategoryUseCase>(),
              ),
        ),
      ],
      child: _MealsDetailsBody(meals),
    );
  }
}

class _MealsDetailsBody extends StatelessWidget {
  final List<Meal> meals;
  const _MealsDetailsBody(this.meals);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.homeBackground),
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

                MealDetails? meal;
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
                            RecommendationsSection(meals: meals),
                            if (errorMessage != null) ...[
                              const SizedBox(height: 16),
                              Text(
                                errorMessage,
                                style: const TextStyle(color: Colors.redAccent),
                              ),
                            ],
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
