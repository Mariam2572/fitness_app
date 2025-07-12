import 'package:fitness_app/features/home/home/presentation/views/widgets/Exercisecard.dart';
import 'package:flutter/material.dart';

class PopularTraining extends StatelessWidget {
  const PopularTraining({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          ExerciseCard(
            title: 'Exercises That\nStrengthen Your Chest',
            taskCount: '24 Tasks',
            level: 'Beginner',
            imagePath: 'assets/images/chestPopTraining.jpg',
          ),
          SizedBox(width: 16),
          // Second Card
          ExerciseCard(
            title: 'Exercises That\nStrengthen Your Back',
            taskCount: '36 Tasks',
            level: 'Intermediate',
            imagePath: 'assets/images/backPopTraining.jpg',
          ),
        ],
      ),
    );
  }
}
