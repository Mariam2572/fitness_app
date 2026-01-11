import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/helper/sized_box_helper.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/auth/forget_password/domain/use_cases/forget_password_use_case.dart';
import 'package:fitness_app/features/auth/forget_password/domain/use_cases/reset_password_use_case.dart';
import 'package:fitness_app/features/auth/forget_password/domain/use_cases/verify_reset_use_case.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/view_model/cubit/forget_password_cubit.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/widgets/forget_password_background.dart';
import 'package:fitness_app/features/auth/forget_password/presentation/widgets/forget_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => ForgetPasswordCubit(
            getIt<ForgetPasswordUseCase>(),
            getIt<VerifyResetUseCase>(),
            getIt<ResetPasswordUseCase>(),
          ),
      child: Builder(
        builder: (context) {
          return Stack(
            children: [
              const ForgetPasswordBackground(),
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
                            context.loc.enter_your_email,
                            style: context.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.neutral10,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            context.loc.forget_password_title,
                            style: context.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: AppColors.neutral10,
                            ),
                          ),
                        ),
                        responsiveHeight(context, 0.01),
                        const ForgetPasswordForm(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
