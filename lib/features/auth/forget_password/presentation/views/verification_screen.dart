import 'dart:ui';

import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/helper/sized_box_helper.dart';
import 'package:fitness_app/core/utils/helper_func/snack_bar.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view_model/cubit/forget_password_cubit.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/views/reset_password_screen.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/widgets/resend_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

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
                          context.loc.otp_code,
                          style: context.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: AppColors.neutral10,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          context.loc.enter_your_otp_check_your_email,
                          style: context.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w400,
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
                          color: AppColors.neutral90.withValues(alpha: .01),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 22.6, sigmaY: 22.6),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PinCodeTextField(
                                appContext: context,
                                length: 6,
                                controller:
                                    forgetPasswordCubit.resetCodeController,
                                animationType: AnimationType.fade,
                                textStyle: const TextStyle(
                                  color: AppColors.mainRed,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.underline,
                                  borderWidth: 2,
                                  inactiveColor: Colors.white54,
                                  activeColor: Colors.red,
                                  selectedColor: Colors.red,
                                  inactiveFillColor: Colors.transparent,
                                  activeFillColor: Colors.transparent,
                                  selectedFillColor: Colors.transparent,
                                  fieldWidth: 50,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                keyboardType: TextInputType.number,
                                animationDuration: const Duration(
                                  milliseconds: 300,
                                ),
                                onChanged: (value) {},
                              ),
                              responsiveHeight(context, 0.01),

                              BlocListener<
                                ForgetPasswordCubit,
                                ForgetPasswordState
                              >(
                                listener: (context, state) {
                                  if (state is VerifyResetSuccess) {
                                    showSnackBar(
                                      context,
                                      'Email Verified Successfully!',
                                    );
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder:
                                            (context) => BlocProvider.value(
                                              value: forgetPasswordCubit,
                                              child: ResetPasswordScreen(),
                                            ),
                                      ),
                                    );
                                  }
                                  if (state is VerifyResetError) {
                                    showErrorSnackBar(
                                      context,
                                      state.failureMessage,
                                    );
                                  }
                                },
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Trigger the registration process
                                    if (forgetPasswordCubit
                                            .resetCodeController
                                            .text
                                            .length <
                                        6) {
                                      showErrorSnackBar(
                                        context,
                                        'Invalid OTP Number',
                                      );
                                      return;
                                    }
                                    forgetPasswordCubit.doIntent(
                                      VerifyResetIntent(),
                                    );
                                    //Navigate to complete registration process
                                  },
                                  child: Text(
                                    context.loc.confirm,
                                    style: context.textTheme.bodyLarge
                                        ?.copyWith(
                                          fontWeight: FontWeight.w900,
                                          color: AppColors.neutral10,
                                        ),
                                  ),
                                ),
                              ),
                              responsiveHeight(context, 0.02),
                              BlocListener<
                                ForgetPasswordCubit,
                                ForgetPasswordState
                              >(
                                listener: (context, state) {
                                  if (state is ResendCodeState) {
                                    showSnackBar(
                                      context,
                                      'Resent code successfully!',
                                    );
                                  }

                                  if (state is ForgetPasswordError) {
                                    showErrorSnackBar(
                                      context,
                                      state.failureMessage,
                                    );
                                  }
                                },
                                child: ResendCode(),
                              ),
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
