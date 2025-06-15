import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/helper/sized_box_helper.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/widgets/shared_container.dart';
import 'package:fitness_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart';
import 'package:fitness_app/features/auth/register/presentation/widgets/already_have_account_section.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterCubit cubit = RegisterCubit();
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: context.padding.top + 15,
                    bottom: context.padding.bottom + 34.0,
                  ),
                  child: Image.asset(AppAssets.logo),
                ),
              ),
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  context.loc.hey_there,
                  style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              responsiveHeight(context, 0.01),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  context.loc.create_account,
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              responsiveHeight(context, 0.02),
              SharedContainer(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    context.loc.register,
                    style: context.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  responsiveHeight(context, 0.02),
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: context.loc.first_name,
                            prefixIcon: Image.asset(
                              AppAssets.user,
                              color: AppColors.neutral5,
                              width: 20,
                              height: 15,
                            ),
                            prefixIconColor: AppColors.neutral5,
                          ),
                        ),
                        responsiveHeight(context, 0.02),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: context.loc.last_name,
                            prefixIcon: Image.asset(
                              AppAssets.user,
                              color: AppColors.neutral5,
                              width: 20,
                              height: 15,
                            ),
                            prefixIconColor: AppColors.neutral5,
                          ),
                        ),
                        responsiveHeight(context, 0.02),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: context.loc.email,
                            prefixIcon: Image.asset(
                              AppAssets.mail,
                              color: AppColors.neutral5,
                              width: 20,
                              height: 15,
                            ),
                            prefixIconColor: AppColors.neutral5,
                          ),
                        ),
                        responsiveHeight(context, 0.02),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: context.loc.password,
                            prefixIcon: Image.asset(
                              AppAssets.lock,
                              color: AppColors.neutral5,
                              width: 20,
                              height: 15,
                            ),
                            prefixIconColor: AppColors.neutral5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  responsiveHeight(context, 0.05),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(context.loc.register,
                      style: context.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  responsiveHeight(context, 0.02),
                  const AlreadyHaveAccountSection(),  
                ],
              ),
              
              // Add your registration form here
            ],
          ),
        ),
      ],
    );
  }
}
