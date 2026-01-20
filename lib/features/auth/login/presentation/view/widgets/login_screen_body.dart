import 'package:fitness_app/core/animation/animated_widgets.dart';
import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/widgets/shared_container.dart';
import 'package:fitness_app/features/auth/login/presentation/view/widgets/dont_have_account_text.dart';
import 'package:fitness_app/features/auth/login/presentation/view/widgets/form_fields_section.dart';
import 'package:fitness_app/features/auth/login/presentation/view/widgets/login_button_bloc_consumer.dart';
import 'package:flutter/material.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AnimatedSlideInWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AnimatedFadeInWidget(
                child: Text(
                  context.loc.hey_there,
                  style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                context.loc.welcomeBack,
                style: context.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SharedContainer(
              height: context.height * .6,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  context.loc.login,
                  style: context.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 16),
                const FormFieldsSection(),
                const SizedBox(height: 16),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesName.forgetPassword);
                    },
                    child: AnimatedFadeInWidget(
                      child: Text(
                        context.loc.forgot_password,
                        style: const TextStyle(
                          color: AppColors.mainRed,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // Primary CTA button with scale animation
                AnimatedScaleInWidget(child: LoginButtonBlocConsumer()),

                const SizedBox(height: 8),

                AnimatedFadeInWidget(child: DoNotHaveAccountText()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
