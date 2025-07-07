import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/features/food/domain/usecases/get_food_categories_usecase.dart';
import 'package:fitness_app/features/food/domain/usecases/get_meals_of_category_usecase.dart';
import 'package:fitness_app/features/food/presentation/view%20model/food_cubit.dart';
import 'package:fitness_app/features/food/presentation/view/widgets/food_recommendation_view_body.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodRecommendationView extends StatefulWidget {
  const FoodRecommendationView({super.key});

  @override
  State<FoodRecommendationView> createState() => _FoodRecommendationViewState();
}

class _FoodRecommendationViewState extends State<FoodRecommendationView> {
  String? currentCategory;
  @override
  didChangeDependencies() {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    if (args != null && args.containsKey("currentCategory")) {
      currentCategory = args["currentCategory"];
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => FoodCubit(
            getIt.get<GetFoodCategoriesUseCase>(),
            getIt.get<GetMealsByCategoryUseCase>(),
          ),
      child:  FoodRecommendationViewBody(currentCategory: currentCategory??""),
    );
  }
}
