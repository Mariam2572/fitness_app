import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/widgets/app_tab_bar.dart';
import 'package:fitness_app/core/utils/widgets/custom_glass_container.dart';
import 'package:fitness_app/features/exercise/presentation/views/widgets/exercise_widget_item.dart';
import 'package:flutter/material.dart';

class ExerciseView extends StatefulWidget {
  const ExerciseView({super.key});

  @override
  State<ExerciseView> createState() => _ExerciseViewState();
}

class _ExerciseViewState extends State<ExerciseView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.homeBackground,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(25),
                    ),
                    child: Image.asset(
                      AppAssets.exercise,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: context.height * 0.45,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: context.height * 0.45,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(36, 36, 36, 0.5),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(25),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Chest Exercise',
                            style: context.textTheme.headlineMedium?.copyWith(
                              color: AppColors.baseWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Lorem Ipsum Dolor Sit Amet Consectetur. Tempus Volutpat Ut Nisi Morbi.',
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: AppColors.baseWhite,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 8
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.neutral0,
                                    width: 1
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Text(
                                  '30 MIN',
                                  style: context.textTheme.bodySmall?.copyWith(
                                    color: AppColors.baseWhite,
                                    fontWeight: FontWeight.w400
                                  ),
                                ),
                              ),
                            Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8,
                                vertical: 8
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.neutral0,
                                    width: .5
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Text(
                                  '130 Cal',
                                  style: context.textTheme.bodySmall?.copyWith(
                                    color: AppColors.mainRed,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: context.height * 0.06,
                            child: AppTabBar(
                              tabViews: [
                                Text('Beginner',
                                  style: context.textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w700
                                  )
                              
                                ),
                                const Text('Intermediate'),
                                const Text('Advanced'),
                                  const Text('Beginner'),
                                const Text('Intermediate'),
                                const Text('Advanced'),
                              ],
                              controller: TabController(length: 6, vsync:this ),
                              tabs: const [
                                'Beginner',
                                'Intermediate',
                                'Advanced',
                                    'Beginner',
                                'Intermediate',
                                'Advanced',
                              ],
                            ),
                          ),
                      
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomGlassContainer(
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return const ExerciseWidgetItem();
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        color: AppColors.neutral50,
                        thickness: .5,
                      );
                    },
                    itemCount: 5,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
