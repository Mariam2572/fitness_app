// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:fitness_app/core/utils/helper_func/animations_func.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/features/auth/register/presentation/widgets/fields_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/helper/sized_box_helper.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/widgets/shared_container.dart';
import 'package:fitness_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart';
import 'package:fitness_app/features/auth/register/presentation/widgets/already_have_account_section.dart';

class RegisterScreenBody extends StatefulWidget {
const  RegisterScreenBody({super.key});

  @override
  State<RegisterScreenBody> createState() => _RegisterScreenBodyState();
}

class _RegisterScreenBodyState extends State<RegisterScreenBody> with SingleTickerProviderStateMixin {
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
    return Stack(
      children: [
        Image.asset(
          AppAssets.authBackGround,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                responsiveHeight(context, 0.01),
                SlideTransition(
                  position: _slidingAnimation,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      context.loc.createAccount,
                      style: context.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                responsiveHeight(context, 0.02),
                SharedContainer(
                  children: [
                    SlideTransition(
                      position: _slidingAnimation,
                      child: Text(
                        textAlign: TextAlign.center,
                        context.loc.register,
                        style: context.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    responsiveHeight(context, 0.02),
                    SlideTransition(position: _slidingAnimation,
                    child: const TextFormFieldsSection()),
                    responsiveHeight(context, 0.05),
                    ElevatedButton(
                      onPressed: () {
                        if (!(context
                                .read<RegisterCubit>()
                                .formKey
                                .currentState
                                ?.validate() ??
                            true)) {
                          return;
                        }
                        Navigator.pushNamed(
                          context,
                          RoutesName.chooseGenderScreen,
                          arguments: context.read<RegisterCubit>(),
                        );
                       
                      },
                      child: Text(
                        context.loc.register,
                        style: context.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    responsiveHeight(context, 0.02),
                    SlideTransition(position: _slidingAnimation,
                    child: const AlreadyHaveAccountSection()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
