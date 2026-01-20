import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/helper_func/snack_bar.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:fitness_app/core/utils/widgets/shared_container.dart';
import 'package:fitness_app/features/auth/change%20password/data/model/change_password_request.dart';
import 'package:fitness_app/features/auth/change%20password/presentation/view%20model/change_password_cubit.dart';
import 'package:fitness_app/features/auth/change%20password/presentation/view%20model/change_password_states.dart';
import 'package:fitness_app/features/auth/change%20password/presentation/widgets/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final currentController = TextEditingController();
  final newController = TextEditingController();
  final confirmController = TextEditingController();

  bool currentObscure = true;
  bool newObscure = true;
  bool confirmObscure = true;

  @override
  void dispose() {
    currentController.dispose();
    newController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.width;
    final screenHeight = context.height;

    return SizedBox(
      width: double.infinity,
      child: SharedContainer(
        height: screenHeight * 0.45,
        children: [
          Column(
            children: [
              Text(
                context.loc.changePassword,
                style: TextStyle(
                  fontSize: screenWidth * 0.055,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              PasswordTextField(
                label: context.loc.currentPassword,
                controller: currentController,
                obscureText: currentObscure,
                onToggleVisibility:
                    () => setState(() {
                      currentObscure = !currentObscure;
                    }),
                screenWidth: screenWidth,
              ),
              SizedBox(height: screenHeight * 0.025),
              PasswordTextField(
                label: context.loc.newPassword,
                controller: newController,
                obscureText: newObscure,
                onToggleVisibility:
                    () => setState(() {
                      newObscure = !newObscure;
                    }),
                screenWidth: screenWidth,
              ),
              SizedBox(height: screenHeight * 0.025),
              PasswordTextField(
                label: context.loc.confirmNewPassword,
                controller: confirmController,
                obscureText: confirmObscure,
                onToggleVisibility:
                    () => setState(() {
                      confirmObscure = !confirmObscure;
                    }),
                screenWidth: screenWidth,
              ),
              SizedBox(height: screenHeight * 0.04),
              BlocListener<ChangePasswordCubit, ChangePasswordState>(
                listener: (context, state) {
                  if (state is ChangePasswordSuccess) {
                    showSnackBar(
                      context,
                      context.loc.passwordChangedSuccessfully,
                    );
                    Navigator.pushReplacementNamed(context, RoutesName.login);
                  } else if (state is ChangePasswordFailure) {
                    showErrorSnackBar(context, state.message);
                  }
                },
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _handleChangePassword,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mainRed,
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.018,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      context.loc.changePassword,
                      style: AppTextStyle.instance.textStyle14.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _handleChangePassword() {
    final current = currentController.text.trim();
    final newPass = newController.text.trim();
    final confirm = confirmController.text.trim();

    if (newPass != confirm) {
      showErrorSnackBar(context, "New password and confirmation do not match");
      return;
    }

    context.read<ChangePasswordCubit>().doIntent(
      SubmitChangePasswordIntent(
        ChangePasswordRequest(password: current, newPassword: newPass),
      ),
    );
  }
}
