import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:fitness_app/features/profile/presentation/view/widgets/languge.dart';
import 'package:flutter/material.dart';

class BuildListTile extends StatelessWidget {
  IconData icon;
  String title;
  Color? color;
  void Function()? onTap;
  BuildListTile({
    super.key,
    required this.icon,
    required this.title,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.mainRed),
              SizedBox(width: 16),
              Text(
                title,
                style: AppTextStyle.instance.textStyle16.copyWith(
                  color: AppColors.baseWhite,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios, color: AppColors.mainRed, size: 16),

              // onTap: onTap, // Implement navigation or action
            ],
          ),
          Divider(color: AppColors.neutral70),
        ],
      ),
    );
  }
}
