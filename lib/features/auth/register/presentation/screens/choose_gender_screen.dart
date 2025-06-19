import 'package:fitness_app/features/auth/register/presentation/screens/widgets/choose_gender_screen_body.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/widgets/complete_registeration_app_bar_and_background_widget.dart';
import 'package:flutter/material.dart';

class ChooseGenderScreen extends StatelessWidget {
  const ChooseGenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CompleteRegisterationAppBarAndBackgroundSection(
      body: ChooseGenderScreenBody(),
    );
  }
}
