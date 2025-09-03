import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/helper_func/animations_func.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/widgets/shared_container.dart';
import 'package:fitness_app/features/auth/login/presentation/view/widgets/dont_have_account_text.dart';
import 'package:fitness_app/features/auth/login/presentation/view/widgets/form_fields_section.dart';
import 'package:fitness_app/features/auth/login/presentation/view/widgets/login_button_bloc_consumer.dart';
import 'package:flutter/material.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slidingAnimation;
  late Offset offset;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    offset = Offset(1, 0);
    setupAnimation();
    super.initState();
  }

  void setupAnimation() {
    _slidingAnimation = Tween<Offset>(
      begin: offset,
      end: Offset.zero,
    ).animate(_animationController);
    _animationController.forward();
  }

  @override
  void didChangeDependencies() {
    setupAnimationBasedOnLocal(context: context, animationController: _animationController, offset: offset, slidingAnimation: _slidingAnimation);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideTransition(
            position: _slidingAnimation,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                context.loc.hey_there,
                style: context.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          SlideTransition(
            position: _slidingAnimation,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                context.loc.welcomeBack,
                style: context.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          SharedContainer(
            height: context.height * .6,
            children: [
              SlideTransition(
                position: _slidingAnimation,
                child: Text(
                  textAlign: TextAlign.center,
                  context.loc.login,
                  style: context.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SlideTransition(
                position: _slidingAnimation,
                child: const FormFieldsSection(),
              ),
              const SizedBox(height: 16),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.forgetPassword);
                  },
                  child: SlideTransition(
                    position: _slidingAnimation,
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

              LoginButtonBlocConsumer(),

              const SizedBox(height: 8),

              SlideTransition(
                position: _slidingAnimation,
                child: DoNotHaveAccountText(),
              ),
            ],
          ),
        ],
      ),
    );
  }

 
}
