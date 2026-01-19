import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// Reusable section header with title and optional "See All" button
class SectionHeader extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final String? seeAllText;
  final VoidCallback? onSeeAllTap;

  const SectionHeader({
    super.key,
    required this.title,
    this.titleStyle,
    this.seeAllText,
    this.onSeeAllTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style:
                titleStyle ??
                textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        if (seeAllText != null && onSeeAllTap != null)
          TextButton(
            onPressed: onSeeAllTap,
            child: Text(
              seeAllText!,
              style: textTheme.bodyLarge?.copyWith(color: AppColors.mainRed),
            ),
          ),
      ],
    );
  }
}
