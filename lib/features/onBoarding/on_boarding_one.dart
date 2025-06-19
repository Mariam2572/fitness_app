import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:flutter/material.dart';

class OnBoardingOne extends StatelessWidget {
  const OnBoardingOne({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingWidget(
      image: AppAssets.onBoardingOne,
      title: "the price of excellence \n is discipline",
      contain:
          "Lorem ipsum dolor sit amet consectetur. Eu urna ut gravida quis id pretium purus. Mauris massa ",
      skip: true,
      onPressedElevated: () {
        Navigator.pushNamed(context, RoutesName.onBoardingTwo);
      },
      activeDotState: 0,
      onPressedOutLined: () {},
    );
  }
}
