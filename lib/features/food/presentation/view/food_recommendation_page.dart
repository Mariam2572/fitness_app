import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/widgets/app_tab_bar.dart';
import 'package:fitness_app/features/food/presentation/view%20model/food_cubit.dart';
import 'package:fitness_app/features/food/presentation/view%20model/food_status.dart';
import 'package:fitness_app/features/food/presentation/view/widgets/meals_category_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FoodRecommendationPage extends StatefulWidget {
  const FoodRecommendationPage({super.key});

  @override
  State<FoodRecommendationPage> createState() => _FoodRecommendationPageState();
}

class _FoodRecommendationPageState extends State<FoodRecommendationPage>
    with TickerProviderStateMixin {
  TabController? _tabController;
  


  @override
  void initState() {
    super.initState();
    final cubit = context.read<FoodCubit>();
  cubit.doIntent(LoadFoodCategoriesIntent()).then((value){
    if(cubit.tabs.isNotEmpty){
      _tabController = TabController(
        length: cubit.tabs.length,
        vsync: this,
      );
      cubit.doIntent(LoadMealsByCategoryIntent(category: cubit.tabs[0].strCategory ?? ''));
      _tabController?.addListener(() {
          final index = _tabController!.index;
        if (!_tabController!.indexIsChanging) {
          final category = cubit.tabs[index].strCategory ?? '';
    cubit.doIntent(
      LoadMealsByCategoryIntent(category: category),
      );}
      });
    }
  });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withValues( alpha: 0.85),
      body: Stack(
        children: [
          Image.asset(AppAssets.homeBackground,),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 20,
              ),
              child: BlocListener<FoodCubit, FoodState>(
                listenWhen:
                    (previous, current) => current is FoodCategoriesSuccess,
                listener: (context, state) {
                  if (state is FoodCategoriesSuccess) {
                  
                  }
                },

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: SvgPicture.asset(AppAssets.backIcon),
                        ),
                        const SizedBox(width: 16),
                        const Text(
                          'Food Recommendation',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    if (context.read<FoodCubit>().tabs.isNotEmpty && _tabController != null)

                      AppTabBar(
                        controller: _tabController!,
                        tabs:

                          context.read<FoodCubit>().tabs.map((level) => Tab(text: level.strCategory ?? ''))
                            .toList(),
                      ),
                    Expanded(
                      child:
                          
                             TabBarView(
                                controller: _tabController,
                                children:
                                    context.read<FoodCubit>().tabs
                                        .map(
                                          (cat) => const MealsByCategoryTab(),
                                        )
                                        .toList(),
                              ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

