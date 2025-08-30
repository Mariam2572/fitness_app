import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/validator.dart';
import 'package:fitness_app/features/auth/login/presentation/view_model/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormFieldsSection extends StatefulWidget {
  const FormFieldsSection({super.key});

  @override
  State<FormFieldsSection> createState() => _FormFieldsSectionState();
}

class _FormFieldsSectionState extends State<FormFieldsSection> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          TextFormField(
            key: const ValueKey('emailField'),
            validator: (value) => Validator.validateEmail(value),
            controller: context.read<LoginCubit>().emailController,
            style: const TextStyle(color: AppColors.baseWhite),
            decoration: InputDecoration(
              labelText: context.loc.email,
              hintStyle: const TextStyle(color: Colors.white),
              prefixIcon: Image.asset(
                AppAssets.mail,
                color: AppColors.neutral5,
                width: 20,
                height: 15,
              ),
              prefixIconColor: AppColors.neutral5,
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            key: const ValueKey('passwordField'),
            validator: (value) => Validator.validatePassword(value),
            controller: context.read<LoginCubit>().passwordController,

            style: const TextStyle(color: AppColors.baseWhite),
            obscureText: isObscure,
            decoration: InputDecoration(
              labelText: context.loc.password,
              hintStyle: const TextStyle(color: Colors.white),
              suffixIcon: InkWell(
                onTap: () {
                  isObscure = !isObscure;
                  setState(() {});
                },
                child: const Icon(Icons.visibility_outlined),
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
        ],
      ),
    );
  }
}
