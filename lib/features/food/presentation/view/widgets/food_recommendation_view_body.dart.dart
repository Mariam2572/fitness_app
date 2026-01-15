import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/widgets/app_tab_bar.dart';
import 'package:fitness_app/features/food/data/models/food_categories_response.dart';
import 'package:fitness_app/features/food/presentation/view%20model/food_cubit.dart';
import 'package:fitness_app/features/food/presentation/view%20model/food_status.dart';
import 'package:fitness_app/features/food/presentation/view/widgets/meals_by_category_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FoodRecommendationViewBody extends StatefulWidget {
  const FoodRecommendationViewBody({super.key, required this.currentCategory});
  final String currentCategory;
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
          Image.asset(AppAssets.homeBackground,
           fit: BoxFit.fill, height: double.infinity, width: double.infinity,),
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
                        int initialIndex = 0;
                        final currentSelectedIndex = _tabs.indexWhere(
                          (tab) => tab.strCategory == widget.currentCategory,
                        );
                        if (currentSelectedIndex != -1) {
                          initialIndex = currentSelectedIndex;
                        }
                        _tabController?.index = initialIndex;
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
                        Text(
                          context.loc.foodRecommendation,
                          style: context.textTheme.headlineSmall?.copyWith(
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
                              ? const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.mainRed,
                                ),
                              )
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
