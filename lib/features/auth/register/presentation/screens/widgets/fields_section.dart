import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/helper/sized_box_helper.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/validator.dart';
import 'package:fitness_app/core/utils/widgets/custom_text_form_field.dart';
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
          CustomTextFormField(
            validator: (value) => Validator.validateName(value),
            controller: context.read<RegisterCubit>().firstNameController,
            labelText: context.loc.first_name,
            prefixIcon: Image.asset(
              AppAssets.user,
              color: AppColors.neutral5,
              width: 20,
              height: 15,
            ),
          ),

          responsiveHeight(context, 0.02),
          CustomTextFormField(
            validator: (value) => Validator.validateName(value),
            controller: context.read<RegisterCubit>().lastNameController,
            labelText: context.loc.last_name,
            prefixIcon: Image.asset(
              AppAssets.user,
              color: AppColors.neutral5,
              width: 20,
              height: 15,
            ),
          ),

          responsiveHeight(context, 0.02),
          CustomTextFormField(
            textKey: Key('emailField'),
            validator: (value) => Validator.validateEmail(value),
            controller: context.read<RegisterCubit>().emailController,
            labelText: context.loc.email,
            prefixIcon: Image.asset(
              AppAssets.mail,
              color: AppColors.neutral5,
              width: 20,
              height: 15,
            ),
          ),
          responsiveHeight(context, 0.02),
          CustomTextFormField(
            textKey: Key('passwordField'),
            validator: (value) => Validator.validatePassword(value),
            controller: context.read<RegisterCubit>().passwordController,
            isObsecure: true,
            suffixIcon: InkWell(
              onTap: () {
                isObscure = !isObscure;
                setState(() {});
              },
              child:
                  isObscure
                      ? const Icon(Icons.visibility_off_outlined)
                      : const Icon(Icons.visibility_outlined),
            ),
            labelText: context.loc.password,
            prefixIcon: Image.asset(
              AppAssets.lock,
              color: AppColors.neutral5,
              width: 20,
              height: 15,
            ),
          ),
          responsiveHeight(context, 0.02),
          CustomTextFormField(
            textKey: Key('confirmPasswordField'),
            validator:
                (value) => Validator.validateConfirmPassword(
                  value,
                  context.read<RegisterCubit>().rePasswordController.text,
                ),
            controller: context.read<RegisterCubit>().rePasswordController,
            isObsecure: true,
            suffixIcon: InkWell(
              onTap: () {
                isObscure = !isObscure;
                setState(() {});
              },
              child:
                  isObscure
                      ? const Icon(Icons.visibility_off_outlined)
                      : const Icon(Icons.visibility_outlined),
            ),
            labelText: context.loc.confirm_password,
            prefixIcon: Image.asset(
              AppAssets.lock,
              color: AppColors.neutral5,
              width: 20,
              height: 15,
            ),
          ),
        ],
      ),
    );
  }
}
