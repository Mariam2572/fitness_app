import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/features/home/home/presentation/views/widgets/categories/category_view.dart';
import 'package:flutter/material.dart';

/// Categories section wrapper
class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = context.loc;
    final text = context.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          loc.category,
          style: text.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Category(),
      ],
    );
  }
}
