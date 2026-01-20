// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:developer';
import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view_model/cubit/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResendCode extends StatefulWidget {
  const ResendCode({super.key});

  @override
  State<ResendCode> createState() => _ResendCodeState();
}

class _ResendCodeState extends State<ResendCode> {
  int remainingSeconds = 30;
  bool canResend = true;
  late Timer timer;

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void startTimer() {
    remainingSeconds = 30;
    canResend = false;
    setState(() {});
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        remainingSeconds--;

        setState(() {});
      } else {
        setState(() {
          canResend = true;
        });
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              context.loc.didnt_receive_verficcation_code,
              style: context.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.neutral10,
              ),
            ),
            GestureDetector(
              onTap:
                  canResend
                      ? () {
                        final cubit = context.read<ForgetPasswordCubit>();
                        cubit.resetCodeController.clear();
                        cubit.doIntent(ForgetPasswordIntent(isResend: true));
                        log('resend function called');
                        startTimer();
                      }
                      : null,
              child: Text(
                context.loc.resend_code,
                style: context.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: canResend ? AppColors.mainRed : Colors.grey,
                  decorationColor: canResend ? AppColors.mainRed : Colors.grey,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        if (!canResend)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              '${context.loc.resend_code_in} $remainingSeconds ${context.loc.seconds}',
              style: TextStyle(color: Colors.grey),
            ),
          ),
      ],
    );
  }
}
