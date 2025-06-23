import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
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
    // final args = ModalRoute.of(context)!.settings.arguments as Meal;

    return BlocProvider(
      create:
          (_) => MealsDetailsCubit(getIt.get<MealsDetailsUsecase>())..doIntent(
            PerformMealsDetails(id: "52959"),

            // (id: args.idMeal!)
          ),
      child: BlocBuilder<MealsDetailsCubit, MealsDetailsState>(
        builder: (context, state) {
          if (state is MealsDetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.mainRed),
            );
          } else if (state is MealsDetailsSuccess) {
            return Scaffold(
              backgroundColor: Colors.grey[900],

              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,

                    children: [
                      Stack(
                        fit: StackFit.passthrough,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/images/test image.png',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Positioned(
                            top: 16,
                            left: 16,
                            child: Container(
                              child: Image.asset(
                                "assets/images/Back.png",
                                scale: 4,
                              ),
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
                                  'Pasta With Meat',
                                  style: AppTextStyle.instance.textStyle24
                                      .copyWith(
                                    color: AppColors.baseWhite,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Lorem Ipsum Dolor Sit Amet Consectetur. Tempus Volutpat Ut Nisi Morbi.',
                                  style: AppTextStyle.instance.textStyle16
                                      .copyWith(color: AppColors.baseWhite),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    NutrientBoxWidget(
                                      value: '100 K',
                                      label: 'Energy',
                                    ),
                                    NutrientBoxWidget(
                                      value: '15 G',
                                      label: 'Protein',
                                    ),
                                    NutrientBoxWidget(
                                      value: '58 G',
                                      label: 'Carbs',
                                    ),
                                    NutrientBoxWidget(
                                      value: '20 G',
                                      label: 'Fat',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
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

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IngredientColumn(
                              meal: state.response.meals![0]),
                        ),
                      ),

                      const SizedBox(height: 8),
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
                          RecommendationCard(
                            imagePath: 'assets/images/test image.png',
                            label: "Pasta with chicks",
                          ),
                          const SizedBox(width: 12),
                          RecommendationCard(
                            imagePath: 'assets/images/pasta image.png',
                            label: "",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // ),
            );
          } else if (state is MealsDetailsFailure) {
            return Center(child: Text(state.error));
          } else {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.mainRed),
            );
          }
        }
      ),
    );
  }
}

