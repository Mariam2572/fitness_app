import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/features/auth/change%20password/presentation/view%20model/change_password_cubit.dart';
import 'package:fitness_app/features/auth/change%20password/presentation/view%20model/change_password_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/helper_func/snack_bar.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:fitness_app/core/utils/widgets/shared_container.dart';
import 'package:fitness_app/features/auth/change%20password/data/model/change_password_request.dart';
import 'package:flutter_svg/svg.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
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
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.02,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: context.padding.top + 15,
                      bottom: screenHeight * 0.03,
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: SvgPicture.asset(
                            AppAssets.backIcon,
                            width: screenWidth * 0.06,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.07),
                        Expanded(
                          child: Text(
                            context.loc.changePassword,
                            style: TextStyle(
                              fontSize: screenWidth * 0.055,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.14),
                  SizedBox(
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
                            _buildPasswordField(
                              label: context.loc.currentPassword,
                              controller: currentController,
                              obscureText: currentObscure,
                              toggle:
                                  () => setState(() {
                                    currentObscure = !currentObscure;
                                  }),
                              screenWidth: screenWidth,
                            ),
                            SizedBox(height: screenHeight * 0.025),
                            _buildPasswordField(
                              label: context.loc.newPassword,
                              controller: newController,
                              obscureText: newObscure,
                              toggle:
                                  () => setState(() {
                                    newObscure = !newObscure;
                                  }),
                              screenWidth: screenWidth,
                            ),
                            SizedBox(height: screenHeight * 0.025),
                            _buildPasswordField(
                              label: context.loc.confirmNewPassword,
                              controller: confirmController,
                              obscureText: confirmObscure,
                              toggle:
                                  () => setState(() {
                                    confirmObscure = !confirmObscure;
                                  }),
                              screenWidth: screenWidth,
                            ),
                            SizedBox(height: screenHeight * 0.04),
                            BlocListener<
                              ChangePasswordCubit,
                              ChangePasswordState
                            >(
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
                                    style: AppTextStyle.instance.textStyle14
                                        .copyWith(
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField({
    required String label,
    required TextEditingController controller,
    required bool obscureText,
    required VoidCallback toggle,
    required double screenWidth,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(color: AppColors.baseWhite),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.white,
          fontSize: screenWidth * 0.04,
        ),
        suffixIcon: InkWell(
          onTap: toggle,
          child: Icon(
            obscureText
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: Colors.white,
          ),
        ),
        prefixIcon: const Icon(Icons.lock, color: AppColors.neutral5),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.mainRed),
          borderRadius: BorderRadius.circular(30),
        ),
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
