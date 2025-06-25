import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
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
    //final mealId = ModalRoute.of(context)!.settings.arguments as String;

    return BlocProvider(
      create: (_) => MealsDetailsCubit(getIt.get<MealsDetailsUsecase>())
        ..doIntent(PerformMealsDetails(id: '52959')),
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




