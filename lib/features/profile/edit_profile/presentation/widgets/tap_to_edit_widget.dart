
import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TapToEditWidget extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback onPressed;
  const TapToEditWidget({super.key, required this.title, required this.value, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Text(
            "$title (",
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              context.loc.tapToEdit,
              style: context.textTheme.bodyMedium
                  ?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.mainRed,
              ),
            ),
            style: ButtonStyle(
              padding: WidgetStatePropertyAll(
                EdgeInsets.zero,
              ),
            ),
          ),
          Text(
            ")",
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
      Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16,
        ),
        width: double.infinity,
        child: Text(
          value,
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        decoration: BoxDecoration(
          color: AppColors.neutral0.withValues(
            alpha: 0.2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          border: Border.all(
            color: AppColors.neutral5,
            width: 1,
          ),
        ),
      ),
    ],);
  }
}
