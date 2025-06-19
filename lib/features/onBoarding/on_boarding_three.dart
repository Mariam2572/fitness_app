import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/features/onBoarding/on_boarding_widget.dart';
import 'package:flutter/material.dart';

class OnBoardingThree extends StatelessWidget {
  const OnBoardingThree({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingWidget(
      image: AppAssets.onBoardingThree,
      title: "NO MORE EXCUSES \n Do It Now",
      contain:
          "Lorem ipsum dolor sit amet consectetur. Eu urna ut gravida quis id pretium purus. Mauris massa ",
      skip: false,
      onPressedElevated: () {
        Navigator.pushNamed(context, RoutesName.login);
      },
      activeDotState: 2,
      onPressedOutLined: () {
        Navigator.pushNamed(context, RoutesName.onBoardingTwo);
      },
    );
  }
}
