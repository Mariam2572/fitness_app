import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/features/food/presentation/view%20model/food_cubit.dart';
import 'package:fitness_app/features/food/presentation/view%20model/food_status.dart';
import 'package:fitness_app/features/food/presentation/view/widgets/food_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealsByCategoryTab extends StatelessWidget {
  const MealsByCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodCubit, FoodState>(
      builder: (context, state) {
        if (state is FoodLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MealsByCategorySuccess) {
          final meals = state.response.meals ?? [];
          return GridView.builder(
            padding: const EdgeInsets.only(top: 10),
            itemCount: meals.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
            ),
            itemBuilder: (context, index) {
              final meal = meals[index];
              return FoodItemCard(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutesName.mealsDetailsScreen,
                    arguments: {'id': meal.id, 'meals': meals},
                  );
                },
                imageUrl: meal.thumbnail ?? '',
                title: meal.name ?? '',
              );
            },
          );
        } else if (state is FoodFailure) {
          return Center(
            child: Text(
              state.error,
              style: const TextStyle(color: Colors.white),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
