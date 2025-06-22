import 'package:fitness_app/features/home/home/presentation/views/widgets/ExerciseCategoriesWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Data class for category information
class CategoryData {
  final String imagePath;
  final String label;

  const CategoryData({
    required this.imagePath,
    required this.label,
  });
}

class Category extends StatelessWidget {
final categories = [
const CategoryData(
imagePath: 'assets/images/O15_31.png',
label: 'Gym',
),
const CategoryData(
imagePath: 'assets/images/O15_31.png',
label: 'Fitness',
),
const CategoryData(
imagePath: 'assets/images/O15_31.png',
label: 'Yoga',
),
const CategoryData(
imagePath: 'assets/images/O15_31.png',
label: 'Aerobics',
),
const CategoryData(
imagePath: 'assets/images/O15_31.png',
label: 'Trainer',
),
];
   Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(4),
        child: ExerciseCategoriesWidget(categories: categories)
    );

  }
}
