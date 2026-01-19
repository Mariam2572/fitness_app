import 'package:flutter/material.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';

class PasswordTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final VoidCallback onToggleVisibility;
  final double screenWidth;

  const PasswordTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.obscureText,
    required this.onToggleVisibility,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(color: AppColors.baseWhite),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.white,
          fontSize: screenWidth * 0.04,
        ),
        suffixIcon: InkWell(
          onTap: onToggleVisibility,
          child: Icon(
            obscureText
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: Colors.white,
          ),
        ),
        prefixIcon: const Icon(Icons.lock, color: AppColors.neutral5),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.mainRed),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
