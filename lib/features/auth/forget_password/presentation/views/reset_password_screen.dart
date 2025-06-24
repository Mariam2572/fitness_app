import 'dart:ui';

import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/helper/sized_box_helper.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/validator.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view_model/cubit/forget_password_cubit.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/views/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final forgetPasswordCubit = context.read<ForgetPasswordCubit>();

        return Stack(
          children: [
            Image.asset(
              AppAssets.authBackground,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: SizedBox(
                  height: context.height * 0.7,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: context.padding.top + 15,
                            bottom: context.padding.bottom + 25.0,
                          ),
                          child: Image.asset(AppAssets.logo),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          context.loc.password_characters,
                          style: context.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.neutral10,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          context.loc.create_new_password,
                          style: context.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: AppColors.neutral10,
                          ),
                        ),
                      ),
                      responsiveHeight(context, 0.01),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 24,
                        ),
                        width: double.infinity,
                        height: context.height * 0.40,
                        decoration: BoxDecoration(
                          color: AppColors.neutral90.withOpacity(.01),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 22.6,
                            sigmaY: 22.6,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Form(
                                key: forgetPasswordCubit.formKeyResetPassword,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextFormField(
                                      key: const ValueKey('passwordField'),
                                      validator:
                                          (value) =>
                                          Validator.validatePassword(value),
                                      controller:
                                      context
                                          .read<ForgetPasswordCubit>()
                                          .newPasswordController,
                                      style: const TextStyle(
                                        color: AppColors.neutral10,
                                      ),
                                      decoration: InputDecoration(
                                        focusColor: AppColors.neutral10,

                                        focusedBorder:
                                        const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppColors.neutral10,
                                            width: 0.5,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(50),
                                          ),
                                        ),
                                        enabledBorder:
                                        const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppColors.neutral10,
                                            width: 0.5,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(50),
                                          ),
                                        ),

                                        labelText: context.loc.password,
                                        labelStyle: context
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                          fontWeight: FontWeight.w800,
                                          color: AppColors.neutral10,
                                        ),
                                        prefixIcon: Image.asset(
                                          AppAssets.lock,
                                          color: AppColors.neutral10,
                                          width: 20,
                                          height: 15,
                                        ),
                                        prefixIconColor: AppColors.neutral10,
                                      ),
                                      obscureText: true,
                                    ),
                                    responsiveHeight(context, 0.01),
                                    TextFormField(obscureText: true,
                                      key: const ValueKey('confirmPasswordField'),
                                      validator:
                                          (value) =>
                                          Validator.validateConfirmPassword(value,forgetPasswordCubit.newPasswordController.text),
                                      controller:
                                      context
                                          .read<ForgetPasswordCubit>()
                                          .newPasswordConfirmController,
                                      style: const TextStyle(
                                        color: AppColors.neutral10,
                                      ),
                                      decoration: InputDecoration(
                                        focusColor: AppColors.neutral10,

                                        focusedBorder:
                                        const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppColors.neutral10,
                                            width: 0.5,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(50),
                                          ),
                                        ),
                                        enabledBorder:
                                        const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppColors.neutral10,
                                            width: 0.5,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(50),
                                          ),
                                        ),

                                        labelText: context.loc.confirm_password,
                                        labelStyle: context
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                          fontWeight: FontWeight.w800,
                                          color: AppColors.neutral10,
                                        ),
                                        prefixIcon: Image.asset(
                                          AppAssets.lock,
                                          color: AppColors.neutral10,
                                          width: 20,
                                          height: 15,
                                        ),
                                        prefixIconColor: AppColors.neutral10,
                                      ),
                                    ),
                                    responsiveHeight(context, 0.02),
                                  ],
                                ),
                              ),
                              responsiveHeight(context, 0.01),
                              BlocListener<
                                  ForgetPasswordCubit,
                                  ForgetPasswordState
                              >(

                                listener: (context, state) {
                                  if (state is ResetPasswordSuccess) {
                                    ScaffoldMessenger.of(
                                      context,
                                    ).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Password Reset Successfully!',
                                        ),
                                        backgroundColor: Colors.green,
                                      ),
                                    );

                                  }
                                  if (state is ResetPasswordError) {
                                    ScaffoldMessenger.of(
                                      context,
                                    ).showSnackBar(
                                      SnackBar(
                                        content: Text(state.failureMessage),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                },
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Trigger the registration process

                                    forgetPasswordCubit.doIntent(
                                      ResetPasswordIntent(),
                                    );
                                    //Navigate to complete registration process
                                  },
                                  child: Text(
                                    context.loc.done,
                                    style: context.textTheme.bodyLarge
                                        ?.copyWith(
                                      fontWeight: FontWeight.w900,
                                      color: AppColors.neutral10,
                                    ),
                                  ),
                                ),
                              ),
                              responsiveHeight(context, 0.02),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
