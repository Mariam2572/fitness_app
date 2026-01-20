import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/features/auth/login/presentation/view/widgets/login_screen_body.dart';
import 'package:flutter/material.dart';

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
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Image.asset(AppAssets.logo),
          ),
          body: LoginScreenBody(),
        ),
      ],
    );
  }
}


