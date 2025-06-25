import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/helper_func/snack_bar.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:fitness_app/core/utils/widgets/shared_container.dart';
import 'package:fitness_app/features/auth/login/data/model/login_request/login_request.dart';
import 'package:fitness_app/features/auth/login/presentation/view_model/login_cubit.dart';
import 'package:fitness_app/features/auth/login/presentation/view_model/login_state.dart';
import 'package:fitness_app/features/auth/login/presentation/widgets/form_fields_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                      bottom: context.padding.bottom + 15.0,
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
                    //  const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        context.loc.forgot_password,
                        style: const TextStyle(
                          color: AppColors.mainRed,
                          fontSize: 14,
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    const Row(
                      children: [
                        Expanded(child: Divider(color: Colors.white)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Or",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Expanded(child: Divider(color: Colors.white)),
                      ],
                    ),

                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialIcon(Icons.facebook),
                        const SizedBox(width: 20),
                        _buildSocialIcon(Icons.g_mobiledata_sharp),
                        const SizedBox(width: 20),
                        _buildSocialIcon(Icons.apple),
                      ],
                    ),

                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: BlocListener<LoginCubit, LoginState>(
                        listener: (context, state) {
                          if (state is LoginSuccess) {
                            showSnackBar(context, 'Login successful');
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              RoutesName.layOut,
                              (route) => false,
                            );
                          }
                          if (state is LoginFailure) {
                            showErrorSnackBar(context, state.error);
                          }
                        },
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.mainRed,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            final cubit = context.read<LoginCubit>();
                            cubit.doIntent(
                              PerformLogin(
                                request: LoginRequest(
                                  email: cubit.emailController.text,
                                  password: cubit.passwordController.text,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            context.loc.login,
                            style: AppTextStyle.instance.textStyle14.copyWith(
                              color: AppColors.baseWhite,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          context.loc.dontHaveAccount,
                          style: const TextStyle(color: Colors.white),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, RoutesName.register);
                          },
                          child: Text(
                            context.loc.register,
                            style: const TextStyle(
                              color: AppColors.mainRed,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
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

Widget _buildSocialIcon(IconData icon) {
  return CircleAvatar(
    radius: 22,
    backgroundColor: Colors.black87,
    child: Icon(icon, color: Colors.white),
  );
}
