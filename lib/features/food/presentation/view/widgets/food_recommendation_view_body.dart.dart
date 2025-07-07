import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:fitness_app/core/utils/widgets/app_tab_bar.dart';
import 'package:fitness_app/features/food/data/models/food_categories_response.dart';
import 'package:fitness_app/features/food/presentation/view%20model/food_cubit.dart';
import 'package:fitness_app/features/food/presentation/view%20model/food_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FoodRecommendationViewBody extends StatefulWidget {
  const FoodRecommendationViewBody({super.key});

  @override
  State<FoodRecommendationViewBody> createState() =>
      _FoodRecommendationViewBodyState();
}

class _FoodRecommendationViewBodyState extends State<FoodRecommendationViewBody>
    with TickerProviderStateMixin {
  TabController? _tabController;
  List<FoodCategory> _tabs = [];

  @override
  void initState() {
    super.initState();
    context.read<FoodCubit>().doIntent(LoadFoodCategoriesIntent());
  }

  void _onTabChanged() {
    final index = _tabController!.index;
    final category = _tabs[index].strCategory ?? '';
    context.read<FoodCubit>().doIntent(
      LoadMealsByCategoryIntent(category: category),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withValues(alpha: 0.85),
      body: Stack(
        children: [
          Image.asset(AppAssets.homeBackground),
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
                    setState(() {
                      _tabs = state.response.categories ?? [];

                      _tabController = TabController(
                        length: _tabs.length,
                        vsync: this,
                      );

                      _tabController!.addListener(() {
                        if (!_tabController!.indexIsChanging) {
                          _onTabChanged();
                        }
                      });

                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _onTabChanged();
                      });
                    });
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
                    if (_tabs.isNotEmpty && _tabController != null)
                      AppTabBar(
                        controller: _tabController!,
                        tabs:
                            _tabs
                                .map(
                                  (level) => Tab(text: level.strCategory ?? ''),
                                )
                                .toList(),
                      ),
                    Expanded(
                      child:
                          _tabs.isEmpty
                              ? const Center(child: CircularProgressIndicator())
                              : TabBarView(
                                controller: _tabController,
                                children:
                                    _tabs
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

class FoodItemCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback onTap;

  const FoodItemCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Positioned.fill(child: Image.network(imageUrl, fit: BoxFit.cover)),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0x80000000), Color(0x80000000)],
                  begin: Alignment.topCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 120,
                  child: Text(
                    title,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.instance.textStyle20.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
