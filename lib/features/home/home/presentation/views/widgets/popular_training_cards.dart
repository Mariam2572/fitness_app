import 'package:fitness_app/features/home/home/presentation/views/widgets/Exercisecard.dart';
import 'package:flutter/material.dart';
class PopularTraining extends StatelessWidget {
  const PopularTraining({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Row(
      children: [
        // First Card
        Expanded(
          child: ExerciseCard(
            title: 'Exercises That\nStrengthen Your Chest',
            taskCount: '24 Tasks',
            level: 'Beginner',
            imagePath: 'assets/images/chestPopTraining.jpg',
            isImageLeft: true,
          ),
        ),
         SizedBox(width: 12),
        // Second Card
        Expanded(
          child: ExerciseCard(
            title: 'Exercises That\nStrengthen Your Back',
            taskCount: '36 Tasks',
            level: 'Intermediate',
            imagePath: 'assets/images/backPopTraining.jpg',
            isImageLeft: false,
          ),
        ),
      ],
    );

  }
}
