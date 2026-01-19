import 'package:fitness_app/features/home/home/presentation/views/widgets/exercise_categories_widget.dart';
import 'package:flutter/material.dart';

// Data class for category information
class CategoryData {
  final String imagePath;
  final String label;

  const CategoryData({required this.imagePath, required this.label});
}

class Category extends StatelessWidget {
  final categories = [
    const CategoryData(imagePath: 'assets/images/gym.png', label: 'Gym'),
    const CategoryData(
      imagePath: 'assets/images/fitness.png',
      label: 'Fitness',
    ),
    const CategoryData(imagePath: 'assets/images/yoga.png', label: 'Yoga'),
    const CategoryData(
      imagePath: 'assets/images/aerobics.png',
      label: 'Aerobics',
    ),
    const CategoryData(
      imagePath: 'assets/images/trainer.png',
      label: 'Trainer',
    ),
  ];
  Category({super.key});

  @override
  Widget build(BuildContext context) {
    return ExerciseCategoriesWidget(categories: categories);
  }
}
