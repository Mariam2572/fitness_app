import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/widgets/shared_container.dart';
import 'package:fitness_app/features/auth/login/presentation/view/widgets/dont_have_account_text.dart';
import 'package:fitness_app/features/auth/login/presentation/view/widgets/form_fields_section.dart';
import 'package:fitness_app/features/auth/login/presentation/view/widgets/login_button_bloc_consumer.dart';
import 'package:fitness_app/features/auth/login/presentation/view/widgets/social_icon_widget.dart';
import 'package:flutter/material.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  // late AnimationController _animationController;
  // late Animation<Offset> _titleAnimation;
  // late Animation<Offset> _subtitleAnimation;
  // late Animation<Offset> _formAnimation;
  // late Animation<Offset> _socialAnimation;
  // late Animation<Offset> _buttonAnimation;
  // late Animation<Offset> _accountTextAnimation;
  // late Offset _offset;

  // @override
  // void initState() {
  //   _animationController = AnimationController(
  //     vsync: this,
  //     duration: Duration(milliseconds: 500),
  //   );
  //   _offset = Offset(1, 0);
  //   super.initState();
  // }

  // @override
  // void didChangeDependencies() {
  //   _initOffsetBasedOnLocal();

  //   setupAnimations();
  //   _animationController.forward();
  //   super.didChangeDependencies();
  // }

  // void _initOffsetBasedOnLocal() {
  //   final local = Localizations.localeOf(context);
  //   _offset = local.languageCode == "ar" ? Offset(-1, 0) : Offset(-1, 0);
  // }

  // setupAnimations() {
  //   _titleAnimation = Tween<Offset>(begin: _offset, end: Offset.zero).animate(
  //     CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
  //   );
  // }

  // @override
  // void dispose() {
  //   _animationController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              context.loc.hey_there,
              style: context.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w400,
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
                  child: Text(
                    context.loc.forgot_password,
                    style: const TextStyle(
                      color: AppColors.mainRed,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              const Row(
                children: [
                  Expanded(child: Divider(color: Colors.white)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Or", style: TextStyle(color: Colors.white)),
                  ),
                  Expanded(child: Divider(color: Colors.white)),
                ],
              ),

              const SizedBox(height: 32),
              Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildSocialIcon(Icons.facebook),

                  buildSocialIcon(Icons.g_mobiledata_sharp),

                  buildSocialIcon(Icons.apple),
                ],
              ),

              const SizedBox(height: 24),
              LoginButtonBlocConsumer(),

              const SizedBox(height: 8),

              DoNotHaveAccountText(),
            ],
          ),
        ],
      ),
    );
  }
}
