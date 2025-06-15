import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/widgets/build_app_bar.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/widgets/choose_gender_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChooseGenderScreen extends StatelessWidget {
  const ChooseGenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(AppAssets.authBackGround, fit: BoxFit.fill),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: buildAppBar(
            leading: SvgPicture.asset(AppAssets.backIcon),
            title: Image.asset(AppAssets.logo, fit: BoxFit.fill), context: context,
          ),
          body: const ChooseGenderScreenBody(),
        ),
      ],
    );
  }


}
