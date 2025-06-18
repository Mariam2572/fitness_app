import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/helper/sized_box_helper.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/validator.dart';
import 'package:fitness_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextFormFieldsSection extends StatefulWidget {
  const TextFormFieldsSection({super.key});

  @override
  State<TextFormFieldsSection> createState() => _TextFormFieldsSectionState();
}

class _TextFormFieldsSectionState extends State<TextFormFieldsSection> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterCubit>().formKey,
      child: Column(
        children: [
          TextFormField(
            key: const ValueKey('firstNameField'),
            validator: (value) => Validator.validateName(value),
            controller: context.read<RegisterCubit>().firstNameController,
            decoration: InputDecoration(
              labelText: "context.loc.first_name",
              prefixIcon: Image.asset(
                AppAssets.user,
                color: AppColors.neutral5,
                width: 20,
                height: 15,
              ),
              prefixIconColor: AppColors.neutral5,
            ),
          ),
          responsiveHeight(context, 0.02),
          TextFormField(
            key: const ValueKey('lastNameField'),
            validator: (value) => Validator.validateName(value),
            controller: context.read<RegisterCubit>().lastNameController,
            decoration: InputDecoration(
              labelText: "context.loc.last_name",
              prefixIcon: Image.asset(
                AppAssets.user,
                color: AppColors.neutral5,
                width: 20,
                height: 15,
              ),
              prefixIconColor: AppColors.neutral5,
            ),
          ),
          responsiveHeight(context, 0.02),
          TextFormField(
            key: const ValueKey('emailField'),
            validator: (value) => Validator.validateEmail(value),
            controller: context.read<RegisterCubit>().emailController,
            decoration: InputDecoration(
              labelText: context.loc.email,
              prefixIcon: Image.asset(
                AppAssets.mail,
                color: AppColors.neutral5,
                width: 20,
                height: 15,
              ),
              prefixIconColor: AppColors.neutral5,
            ),
          ),
          responsiveHeight(context, 0.02),
          TextFormField(
            key: const ValueKey('passwordField'),
            validator: (value) => Validator.validatePassword(value),
            controller: context.read<RegisterCubit>().passwordController,
            obscureText: isObscure,
            decoration: InputDecoration(
              labelText: context.loc.password,
              suffixIcon: InkWell(
                onTap: () {
                  isObscure = !isObscure;
                  setState(() {});
                },
                child: Image.asset(AppAssets.eyes),
              ),
              prefixIcon: Image.asset(
                AppAssets.lock,
                color: AppColors.neutral5,
                width: 20,
                height: 15,
              ),
              prefixIconColor: AppColors.neutral5,
            ),
          ),
          responsiveHeight(context, 0.02),
          TextFormField(
            key: const ValueKey('confirmPasswordField'),
            validator:
                (value) => Validator.validateConfirmPassword(
                  value,
                  context.read<RegisterCubit>().passwordController.text,
                ),
            controller: context.read<RegisterCubit>().rePasswordController,
            obscureText: isObscure,
            decoration: InputDecoration(
              suffixIcon: InkWell(
                onTap: () {
                  isObscure = !isObscure;
                  setState(() {});
                },
                child: Image.asset(AppAssets.eyes),
              ),
              labelText: "context.loc.confirm_password",
              prefixIcon: Image.asset(
                AppAssets.lock,
                color: AppColors.neutral5,
                width: 20,
                height: 15,
              ),
              prefixIconColor: AppColors.neutral5,
            ),
          ),
        ],
      ),
    );
  }
}
