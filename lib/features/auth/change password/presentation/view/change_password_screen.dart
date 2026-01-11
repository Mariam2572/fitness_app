import 'package:flutter/material.dart';
import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/features/auth/change%20password/presentation/widgets/auth_app_bar.dart';
import 'package:fitness_app/features/auth/change%20password/presentation/widgets/auth_background.dart';
import 'package:fitness_app/features/auth/change%20password/presentation/widgets/change_password_form.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.width;
    final screenHeight = context.height;

    return Stack(
      children: [
        const AuthBackground(),
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
                  AuthAppBar(title: context.loc.changePassword),
                  SizedBox(height: screenHeight * 0.14),
                  const ChangePasswordForm(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
