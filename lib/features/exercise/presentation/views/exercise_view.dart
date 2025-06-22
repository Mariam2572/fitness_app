import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/widgets/custom_glass_container.dart';
import 'package:fitness_app/features/exercise/presentation/views/widgets/exercise_widget_item.dart';
import 'package:flutter/material.dart';

class ExerciseView extends StatelessWidget {
  const ExerciseView({super.key});

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
    );
  }
}
