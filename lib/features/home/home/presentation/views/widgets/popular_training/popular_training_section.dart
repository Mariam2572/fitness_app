import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/popular_training/popular_training_cards.dart';
import 'package:flutter/material.dart';

/// Popular training section wrapper
class PopularTrainingSection extends StatelessWidget {
  const PopularTrainingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = context.loc;
    final text = context.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          loc.popularTraining,
          style: text.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        const PopularTraining(),
      ],
    );
  }
}
