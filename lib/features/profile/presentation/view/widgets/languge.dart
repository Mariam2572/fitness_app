import 'package:fitness_app/core/provider/app_config_provider.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Languge extends StatelessWidget {
  const Languge({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppConfigProvider>(
      builder: (context, provider, _) {
        final isEnglish = provider.appLanguage == 'en';

        return Column(
          children: [
            Row(
              children: [
                Icon(Icons.language, color: AppColors.mainRed),
                SizedBox(width: 16),
                Text(
                  isEnglish ? 'Language (English)' : 'اللغة (عربي)',
                  style: AppTextStyle.instance.textStyle16.copyWith(
                    color: AppColors.baseWhite,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    value: isEnglish,
                    onChanged: (value) {
                      final newLang = value ? 'en' : 'ar';
                      provider.changeLanguage(newLang);
                    },
                    activeThumbColor: Colors.white,
                    activeTrackColor: AppColors.mainRed,
                    splashRadius: 2,
                  ),
                ),
              ],
            ),
            Divider(color: AppColors.neutral70),
          ],
        );
      },
    );
  }
}
