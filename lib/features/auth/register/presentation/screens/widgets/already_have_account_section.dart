import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccountSection extends StatelessWidget {
  const AlreadyHaveAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context.loc.already_have_account,
          style: text.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.login);
          },
          child: Text(
            context.loc.login,
            style: text.bodyMedium!.copyWith(
              color: AppColors.mainRed,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.mainRed,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
