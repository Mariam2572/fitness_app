import 'dart:ui';

import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/helper/sized_box_helper.dart';
import 'package:fitness_app/core/utils/helper_func/snack_bar.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view_model/cubit/forget_password_cubit.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/views/verification_screen.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/widgets/forget_password_email_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final forgetPasswordCubit = context.read<ForgetPasswordCubit>();
    final screenWidth = context.width;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      width: double.infinity,
      height: context.height * 0.3,
      decoration: BoxDecoration(
        color: AppColors.neutral90.withValues(alpha: .01),
        borderRadius: BorderRadius.circular(50.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 22.6, sigmaY: 22.6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: forgetPasswordCubit.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ForgetPasswordEmailField(
                    controller: forgetPasswordCubit.emailController,
                    screenWidth: screenWidth,
                  ),
                  responsiveHeight(context, 0.02),
                ],
              ),
            ),
            responsiveHeight(context, 0.01),
            BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
              listener: (context, state) {
                if (state is ForgetPasswordSuccess) {
                  showSnackBar(context, context.loc.email_sent_successfully);
                  if (context.mounted) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder:
                            (context) => BlocProvider.value(
                              value: forgetPasswordCubit,
                              child: VerificationScreen(),
                            ),
                      ),
                    );
                  }
                }
                if (state is ForgetPasswordError) {
                  showErrorSnackBar(context, state.failureMessage);
                }
              },
              child: ElevatedButton(
                onPressed: () {
                  if (forgetPasswordCubit.formKey.currentState!.validate()) {
                    forgetPasswordCubit.doIntent(ForgetPasswordIntent());
                  }
                },
                child: Text(
                  context.loc.send_otp,
                  style: context.textTheme.bodyLarge?.copyWith(
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
    );
  }
}
