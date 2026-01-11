import 'package:flutter/material.dart';
import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/validator.dart';

class ForgetPasswordEmailField extends StatelessWidget {
  final TextEditingController controller;
  final double screenWidth;

  const ForgetPasswordEmailField({
    super.key,
    required this.controller,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const ValueKey('emailField'),
      validator: (value) => Validator.validateEmail(value),
      controller: controller,
      style: const TextStyle(color: AppColors.neutral10),
      decoration: InputDecoration(
        focusColor: AppColors.neutral10,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.neutral10, width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.neutral10, width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        labelText: context.loc.email,
        labelStyle: context.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w800,
          color: AppColors.neutral10,
        ),
        prefixIcon: Image.asset(
          AppAssets.mail,
          color: AppColors.neutral10,
          width: 20,
          height: 15,
        ),
        prefixIconColor: AppColors.neutral10,
      ),
    );
  }
}
