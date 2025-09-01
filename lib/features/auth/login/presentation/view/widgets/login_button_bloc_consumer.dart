import 'package:fitness_app/core/constants/constants.dart';
import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/helper/secure_storage.dart';
import 'package:fitness_app/core/utils/helper_func/snack_bar.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:fitness_app/features/auth/login/data/model/login_request/login_request.dart';
import 'package:fitness_app/features/auth/login/presentation/view_model/login_cubit.dart';
import 'package:fitness_app/features/auth/login/presentation/view_model/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButtonBlocConsumer extends StatelessWidget {
  const LoginButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LoginSuccess) {
          //added the token here so i can get it from the login navigation
          final token = state.response.token;
          if (token != null && token.isNotEmpty) {
            await secureStorage.write(
              key: Constants.userToken,
              value: token,
            );
            showSnackBar(context, 'Login successful');
            Navigator.pushNamedAndRemoveUntil(
            context,
            RoutesName.layOut,
            (route) => false,
          );
            // Future.delayed(const Duration(milliseconds: 500), () {
            //   if (context.mounted) {
            //     Navigator.pushNamedAndRemoveUntil(
            //       context,
            //       RoutesName.layOut,
            //       (route) => false,
            //     );
            //   }
            // });
          } else {
            showErrorSnackBar(
              context,
              'Token is missing in response',
            );
          }
         
          
        }
        if (state is LoginFailure) {
          showErrorSnackBar(context, state.error);
        }
      },
      builder: (BuildContext context, LoginState state) {
        return ElevatedButton(
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
          child:
              state is LoginLoading
                  ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.baseWhite,
                    ),
                  )
                  : Text(
                    context.loc.login,
                    style: AppTextStyle.instance.textStyle14.copyWith(
                      color: AppColors.baseWhite,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
        );
      },
    );
  }
}