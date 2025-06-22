import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:fitness_app/features/foodDetails/data/model/meals_datails_response/meal.dart';
import 'package:fitness_app/features/foodDetails/presentation/view/widgets/ingredient_item.dart';
import 'package:fitness_app/features/foodDetails/presentation/view/widgets/nutrient_box_widget.dart';
import 'package:fitness_app/features/foodDetails/presentation/view/widgets/recommendation_card.dart';
import 'package:flutter/material.dart';

class MealsDetailsScreen extends StatelessWidget {
  const MealsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments! as Meal;

    return
    //  BlocProvider(
    //   create:
    //       (_) => MealsDetailsCubit(getIt.get<MealsDetailsUsecase>())..doIntent(
    //         PerformMealsDetails(id: args.idMeal!),
    //         // (id: args.idMeal!)
    //       ),
    // child:
    Scaffold(
      backgroundColor: Colors.grey[900],

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset('assets/images/test image.png'),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: Container(
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
                        'Pasta With Meat',
                        style: AppTextStyle.instance.textStyle24.copyWith(
                          color: AppColors.baseWhite,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Lorem Ipsum Dolor Sit Amet Consectetur. Tempus Volutpat Ut Nisi Morbi.',
                        style: AppTextStyle.instance.textStyle16.copyWith(
                          color: AppColors.baseWhite,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                child: Column(
                  children: [
                    IngredientItem(name: 'Meal Breasts', amount: '250g'),
                    IngredientItem(name: 'Unsalted Butter', amount: '1 tbsp'),
                    IngredientItem(
                      name: 'Sesame Or Vegetable Oil',
                      amount: '2 Tsp',
                    ),
                    IngredientItem(name: 'Fresh Ginger', amount: '2 Tsp'),
                    IngredientItem(name: 'Large Eggs', amount: '100 G'),
                  ],
                ),
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
                  label: "Pasta with chicks",
                ),
              ],
            ),
          ],
        ),
      ),
      // ),
    );
  }

  // Widget _recommendationCard(String imagePath) {
  //   return Container(
  //     height: 160,
  //     width: 163,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(20),

  //       image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill),
  //     ),
  //     child: Stack(
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.only(left: 16, bottom: 16, right: 20),
  //           child: Text(
  //             "data",
  //             style: AppTextStyle.instance.textStyle16.copyWith(
  //               color: AppColors.baseWhite,
  //               fontWeight: FontWeight.w600,
  //             ),
  //           ),
  //         ),
  //       ],
  //       alignment: Alignment.bottomCenter,
  //     ),
  //   );
  // }
}

// class ProductsDetails extends StatelessWidget {
//   const ProductsDetails({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final args = ModalRoute.of(context)!.settings.arguments! as Product;

//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<CartCubit>(create: (context) => getIt<CartCubit>()),
//         BlocProvider(
//           create:
//               (_) =>
//                   ProductDetailsCubit(getIt.get<GetProductDetailsUseCase>())
//                     ..fetchProduct(args.id!),
//         ),
//         BlocProvider.value(value: getIt<CartCubit>()),
//       ],
//       child: Scaffold(
//         appBar: AppBar(
//           leading: InkWell(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: const Icon(Icons.arrow_back_ios),
//           ),
//         ),
//         body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
//           builder: (context, state) {
//             if (state is ProductDetailsSuccess) {
//               log("product data i will receive in product details ${args.id}");
//               return BlocListener<CartCubit, CartState>(
//                 listener: (context, cartState) {
//                   if (cartState is CartSuccess) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         backgroundColor: Colors.green,
//                         content: Text("Product added to cart"),
//                         duration: Duration(seconds: 2),
//                       ),
//                     );
//                   } else if (cartState is CartFailure) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         backgroundColor: Colors.red,
//                         content: Text("Failed to add product to cart"),
//                         duration: Duration(seconds: 2),
//                       ),
//                     );
//                   }
//                 },
//                 child: ProductDetailsBody(product: state.product),
//               );
//             } else if (state is ProductDetailsError) {
//               return Center(child: Text(state.message));
//             } else {
//               return const Center(
//                 child: CircularProgressIndicator(
//                   color: PalletsColors.mainColorBase,
//                 ),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
