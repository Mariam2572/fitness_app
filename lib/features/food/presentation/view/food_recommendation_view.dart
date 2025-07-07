import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/features/food/domain/usecases/get_food_categories_usecase.dart';
import 'package:fitness_app/features/food/domain/usecases/get_meals_of_category_usecase.dart';
import 'package:fitness_app/features/food/presentation/view%20model/food_cubit.dart';
import 'package:fitness_app/features/food/presentation/view/widgets/food_recommendation_view_body.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodRecommendationView extends StatelessWidget {
  const FoodRecommendationView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodCubit(
                getIt.get<GetFoodCategoriesUseCase>(),
                getIt.get<GetMealsByCategoryUseCase>(),
              ),
      child: const FoodRecommendationViewBody(),
    );
  }
}
