import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/helper_func/snack_bar.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:fitness_app/core/utils/validator.dart';
import 'package:fitness_app/core/utils/widgets/shared_container.dart';
import 'package:fitness_app/features/auth/login/data/model/login_request/login_request.dart';
import 'package:fitness_app/features/auth/login/presentation/view_model/login_cubit.dart';
import 'package:fitness_app/features/auth/login/presentation/view_model/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

Widget _buildSocialIcon(IconData icon) {
  return CircleAvatar(
    radius: 22,
    backgroundColor: Colors.black87,
    child: Icon(icon, color: Colors.white),
  );
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = true;
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
                    TextFormField(
                      key: const ValueKey('emailField'),
                      validator: (value) => Validator.validateEmail(value),
                      controller: context.read<LoginCubit>().emailController,
                      style: const TextStyle(color: AppColors.baseWhite),

                      decoration: InputDecoration(
                        labelText: context.loc.email,
                        hintStyle: const TextStyle(color: Colors.white),
                        prefixIcon: Image.asset(
                          AppAssets.mail,
                          color: AppColors.neutral5,
                          width: 20,
                          height: 15,
                        ),
                        prefixIconColor: AppColors.neutral5,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      key: const ValueKey('passwordField'),
                      validator: (value) => Validator.validatePassword(value),
                      controller: context.read<LoginCubit>().passwordController,

                      style: const TextStyle(color: AppColors.baseWhite),
                      obscureText: isObscure,
                      decoration: InputDecoration(
                        labelText: context.loc.password,
                        hintStyle: const TextStyle(color: Colors.white),
                        suffixIcon: InkWell(
                          onTap: () {
                            isObscure = !isObscure;
                            setState(() {});
                          },
                          child: const Icon(Icons.visibility_outlined),
                        ),
                        prefixIcon: Image.asset(
                          AppAssets.lock,
                          color: AppColors.neutral5,
                          width: 20,
                          height: 15,
                        ),
                        prefixIconColor: AppColors.neutral5,
                      ),
                    ),
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
                            Navigator.pushNamed(context, RoutesName.layOut);
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

    //   return Scaffold(
    //     body: Stack(
    //       children: [
    //         Image.asset(AppAssets.authBackGround),
    //         Container(
    //           decoration: const BoxDecoration(
    //             image: DecorationImage(
    //               image: AssetImage(AppAssets.authBackground),
    //               fit: BoxFit.cover,
    //             ),
    //           ),
    //         ),
    //         Container(color: Colors.black.withOpacity(0.6)),

    //         SafeArea(
    //           child: Center(
    //             child: SingleChildScrollView(
    //               padding: const EdgeInsets.all(24),
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Image.asset(AppAssets.logo, height: 80),
    //                   const SizedBox(height: 40),
    //                   Align(
    //                     alignment: Alignment.centerLeft,
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           context.loc.heyThere,
    //                           style: const TextStyle(
    //                             color: Colors.white,
    //                             fontSize: 18,
    //                           ),
    //                         ),
    //                         Text(
    //                           context.loc.welcomeBack,
    //                           style: const TextStyle(
    //                             fontSize: 22,
    //                             fontWeight: FontWeight.bold,
    //                             color: Colors.white,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),

    //                   const SizedBox(height: 16),

    //                   SharedContainer(
    //                     children: [
    //                       Text(
    //                         context.loc.login,
    //                         style: const TextStyle(
    //                           fontSize: 24,
    //                           fontWeight: FontWeight.bold,
    //                           color: Colors.white,
    //                         ),
    //                       ),
    //                       const SizedBox(height: 16),

    //                       // _buildInputField(Icons.email_outlined, "Email"),
    //                       TextFormField(
    //                         key: const ValueKey('emailField'),
    //                         validator: (value) => Validator.validateEmail(value),
    //                         controller:
    //                             context.read<LoginCubit>().emailController,
    //                         style: const TextStyle(color: AppColors.baseWhite),

    //                         decoration: InputDecoration(
    //                           labelText: context.loc.email,
    //                           hintStyle: const TextStyle(color: Colors.white),
    //                           prefixIcon: Image.asset(
    //                             AppAssets.mail,
    //                             color: AppColors.neutral5,
    //                             width: 20,
    //                             height: 15,
    //                           ),
    //                           prefixIconColor: AppColors.neutral5,
    //                         ),
    //                       ),
    //                       const SizedBox(height: 16),
    //                       TextFormField(
    //                         key: const ValueKey('passwordField'),
    //                         validator:
    //                             (value) => Validator.validatePassword(value),
    //                         controller:
    //                             context.read<LoginCubit>().passwordController,

    //                         style: const TextStyle(color: AppColors.baseWhite),
    //                         obscureText: isObscure,
    //                         decoration: InputDecoration(
    //                           labelText: context.loc.password,
    //                           hintStyle: const TextStyle(color: Colors.white),
    //                           suffixIcon: InkWell(
    //                             onTap: () {
    //                               isObscure = !isObscure;
    //                               setState(() {});
    //                             },
    //                             child: const Icon(Icons.visibility_outlined),
    //                           ),
    //                           prefixIcon: Image.asset(
    //                             AppAssets.lock,
    //                             color: AppColors.neutral5,
    //                             width: 20,
    //                             height: 15,
    //                           ),
    //                           prefixIconColor: AppColors.neutral5,
    //                         ),
    //                       ),
    //                       const SizedBox(height: 8),
    //                       Align(
    //                         alignment: Alignment.centerRight,
    //                         child: Text(
    //                           context.loc.forgot_password,
    //                           style: const TextStyle(
    //                             color: AppColors.mainRed,
    //                             fontSize: 14,
    //                           ),
    //                         ),
    //                       ),

    //                       const SizedBox(height: 24),

    //                       const Row(
    //                         children: [
    //                           Expanded(child: Divider(color: Colors.white)),
    //                           Padding(
    //                             padding: EdgeInsets.symmetric(horizontal: 10),
    //                             child: Text(
    //                               "Or",
    //                               style: TextStyle(color: Colors.white),
    //                             ),
    //                           ),
    //                           Expanded(child: Divider(color: Colors.white)),
    //                         ],
    //                       ),

    //                       const SizedBox(height: 32),
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.center,
    //                         children: [
    //                           _buildSocialIcon(Icons.facebook),
    //                           const SizedBox(width: 20),
    //                           _buildSocialIcon(Icons.g_mobiledata_sharp),
    //                           const SizedBox(width: 20),
    //                           _buildSocialIcon(Icons.apple),
    //                         ],
    //                       ),

    //                       const SizedBox(height: 24),
    //                       SizedBox(
    //                         width: double.infinity,
    //                         child: BlocListener<LoginCubit, LoginState>(
    //                           listener: (context, state) {
    //                             if (state is LoginSuccess) {
    //                               showSnackBar(context, 'Login successful');
    //                             }
    //                             if (state is LoginFailure) {
    //                               showErrorSnackBar(context, state.error);
    //                             }
    //                           },
    //                           child: ElevatedButton(
    //                             style: ElevatedButton.styleFrom(
    //                               backgroundColor: AppColors.mainRed,
    //                               padding: const EdgeInsets.symmetric(
    //                                 vertical: 14,
    //                               ),
    //                               shape: RoundedRectangleBorder(
    //                                 borderRadius: BorderRadius.circular(30),
    //                               ),
    //                             ),
    //                             onPressed: () {
    //                               final cubit = context.read<LoginCubit>();
    //                               cubit.doIntent(
    //                                 PerformLogin(
    //                                   request: LoginRequest(
    //                                     email: cubit.emailController.text,
    //                                     password: cubit.passwordController.text,
    //                                   ),
    //                                 ),
    //                               );
    //                               Navigator.pushNamed(context, RoutesName.layOut);
    //                             },
    //                             child: Text(
    //                               context.loc.login,

    //                               style: AppTextStyle.instance.textStyle14
    //                                   .copyWith(
    //                                     color: AppColors.baseWhite,
    //                                     fontWeight: FontWeight.w900,
    //                                   ),
    //                             ),
    //                           ),
    //                         ),
    //                       ),

    //                       const SizedBox(height: 8),

    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.center,
    //                         children: [
    //                           Text(
    //                             context.loc.dontHaveAccount,
    //                             style: const TextStyle(color: Colors.white),
    //                           ),
    //                           InkWell(
    //                             onTap: () {
    //                               Navigator.pushNamed(
    //                                 context,
    //                                 RoutesName.register,
    //                               );
    //                             },
    //                             child: Text(
    //                               context.loc.register,
    //                               style: const TextStyle(
    //                                 color: AppColors.mainRed,
    //                                 fontWeight: FontWeight.bold,
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
    // }
  }
}
