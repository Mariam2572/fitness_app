import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DoNotHaveAccountText extends StatelessWidget {
  const DoNotHaveAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context.loc.dontHaveAccount,
          style: const TextStyle(color: Colors.white),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, RoutesName.register);
          },
          child: Text(
            context.loc.register,
            style: const TextStyle(
              color: AppColors.mainRed,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
