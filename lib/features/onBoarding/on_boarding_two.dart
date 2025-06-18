import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/feature/onBoarding/on_boarding_widget.dart';
import 'package:flutter/material.dart';

class OnBoardingTwo extends StatelessWidget {
  const OnBoardingTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingWidget(
      image: AppAssets.onBoardingTwo,
      title: "Fitness has never been so \n much fun",
      contain:
          "Lorem ipsum dolor sit amet consectetur. Eu urna ut gravida quis id pretium purus. Mauris massa ",
      skip: true,
      onPressedElevated: () {
        Navigator.pushNamed(context, RoutesName.onBoardingThree);
      },
      activeDotState: 1,
      onPressedOutLined: () {
        Navigator.pushNamed(context, RoutesName.onBoardingOne);
      },
    );
  }
}
