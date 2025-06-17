// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fitness_app/core/utils/enums/gender.dart';
import 'package:fitness_app/features/auth/register/data/models/request/register_request.dart';
import 'package:fitness_app/features/auth/register/presentation/widgets/fields_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/helper/sized_box_helper.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/widgets/shared_container.dart';
import 'package:fitness_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart';
import 'package:fitness_app/features/auth/register/presentation/widgets/already_have_account_section.dart';

class RegisterScreenBody extends StatelessWidget {
  RegisterScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    const TextFormFieldsSection(),
                    responsiveHeight(context, 0.05),
                    BlocListener<RegisterCubit, RegisterState>(
                      listener: (context, state) {
                        if (state is RegisterSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Registration Successful!'),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                        if (state is RegisterFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.error),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      child: ElevatedButton(
                        onPressed: () {
                          // Trigger the registration process
                          final cubit = context.read<RegisterCubit>();
                          cubit.doIntent(
                            RegisterUserIntent(
                              request: RegisterRequest(
                                firstName: cubit.firstNameController.text,
                                lastName: cubit.lastNameController.text,
                                email: cubit.emailController.text,
                                password: cubit.passwordController.text,
                                rePassword: cubit.rePasswordController.text,
                                height: 155,
                                weight: 60,
                                age: 24,
                                goal: "cubit.goal",
                                activityLevel: "level2",
                                gender: Gender.male.name,
                              ),
                            ),
                          );
                          //Navigate to complete registration process
                        },
                        child: Text(
                          context.loc.register,
                          style: context.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    responsiveHeight(context, 0.02),
                    const AlreadyHaveAccountSection(),
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
