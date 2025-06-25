import 'package:fitness_app/features/auth/register/presentation/screens/widgets/choose_height_screen_body.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/widgets/complete_registeration_app_bar_and_background_widget.dart';
import 'package:flutter/material.dart';

class ChooseHeightScreen extends StatelessWidget {
  const ChooseHeightScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const CompleteRegisterationAppBarAndBackgroundSection(
      body: ChooseHeightScreenBody(),
    );
  }
}
