
import 'package:fitness_app/features/auth/register/presentation/screens/widgets/circular_percent_indicator_widget.dart';
import 'package:flutter/material.dart';


class ChooseAgeScreenBody extends StatelessWidget {
  const ChooseAgeScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         SizedBox(height: 100),
        CircularPercentIndicatorWidget(percent: 0.1, achive: '2/6',),
         SizedBox(height: 18),
      ],
    );
  }
}

