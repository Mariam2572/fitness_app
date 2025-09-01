import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.validator,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon, this.textKey, this.isObsecure,
  });
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Key? textKey;
  final bool? isObsecure;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObsecure ?? false,
      key:   textKey,
      validator: validator,
      controller: controller,
     style: const TextStyle(color: AppColors.baseWhite),
      decoration: InputDecoration(
        labelText: labelText,
        hintStyle: const TextStyle(color: Colors.white),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefixIconColor: AppColors.neutral5,
      ),
    );
  }
}
