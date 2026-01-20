import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/features/food/data/models/meals_of_category_response.dart';
import 'package:fitness_app/features/food/domain/usecases/get_food_categories_usecase.dart';
import 'package:fitness_app/features/food/domain/usecases/get_meals_of_category_usecase.dart';
import 'package:fitness_app/features/food/presentation/view%20model/food_cubit.dart';
import 'package:fitness_app/features/foodDetails/domain/usecases/meals_details_usecase.dart';
import 'package:fitness_app/features/foodDetails/presentation/view/meal_details_body.dart';
import 'package:fitness_app/features/foodDetails/presentation/view_model/meals_details_cubit.dart';
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
          child: MealsDetailsBody(meals),
        ),
        BlocProvider(
          create:
              (_) => FoodCubit(
                getIt.get<GetFoodCategoriesUseCase>(),
                getIt.get<GetMealsByCategoryUseCase>(),
              ),
        ),
      ],
      child: MealsDetailsBody(meals),
    );
  }
}
