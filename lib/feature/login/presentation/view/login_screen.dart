import 'package:fitness_app/core/base/base_state.dart';
import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/validator.dart';
import 'package:fitness_app/core/utils/widgets/shared_container.dart';
import 'package:fitness_app/feature/login/data/model/login_request.dart';
import 'package:fitness_app/feature/login/data/model/login_response/login_response.dart';
import 'package:fitness_app/feature/login/presentation/view_model/login_cubit.dart';
import 'package:fitness_app/feature/login/presentation/view_model/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/auth back ground.png"),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.authBackground),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(color: Colors.black.withOpacity(0.6)),

          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logo.png', height: 80),
                    const SizedBox(height: 40),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hey There",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            "WELCOME BACK",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    SharedContainer(
                      children: [
                        const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // _buildInputField(Icons.email_outlined, "Email"),
                        TextFormField(
                          key: const ValueKey('emailField'),
                          validator: (value) => Validator.validateEmail(value),
                          controller:
                              context.read<LoginCubit>().emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Image.asset(
                              AppAssets.mail,
                              color: AppColors.neutral5,
                              width: 20,
                              height: 15,
                            ),
                            prefixIconColor: AppColors.neutral5,
                          ),
                        ),

                        TextFormField(
                          key: const ValueKey('passwordField'),
                          validator:
                              (value) => Validator.validatePassword(value),
                          controller:
                              context.read<LoginCubit>().passwordController,
                          obscureText: isObscure,
                          decoration: InputDecoration(
                            labelText: 'Password',
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
                        const SizedBox(height: 8),

                        const SizedBox(height: 8),

                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forget Password ?",
                            style: TextStyle(
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

                        const SizedBox(height: 24),
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
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Login Successful!'),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              }
                              if (state is LoginFailure) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(state.error),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            },
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainRed,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed: () {
                                var cubit = context.read<LoginCubit>();
                                cubit.doIntent(
                                  PerformLogin(
                                    request: LoginRequest(
                                      email: cubit.emailController.text,
                                      password: cubit.passwordController.text,
                                    ),
                                  ),
                                );
                              },
                              child:  Text(
                                context.loc.login,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don’t Have An Account Yet ? ",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Register",
                              style: TextStyle(
                                color: AppColors.mainRed,
                                fontWeight: FontWeight.bold,
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
          ),
        ],
      ),
    );
  }

  // Widget _buildInputField(
  Widget _buildSocialIcon(IconData icon) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: Colors.black87,
      child: Icon(icon, color: Colors.white),
    );
  }
}
