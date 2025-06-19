import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class OnBoardingWidget extends StatelessWidget {
  final String image;
  final String title;
  final String contain;
  final bool skip;
  final Function()? onPressedElevated;
  final Function()? onPressedOutLined;
  final int activeDotState;
  const OnBoardingWidget({
    super.key,
    required this.title,
    required this.contain,
    required this.image,
    required this.skip,
    required this.onPressedElevated,
    required this.onPressedOutLined,
    required this.activeDotState,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(AppAssets.onBoardingBackGround, fit: BoxFit.cover),
            Center(child: Image.asset(image, fit: BoxFit.contain,height: double.infinity
              ,)),
            Padding(
              padding: const EdgeInsets.only(top: 40, right: 17),
              child: Align(
                alignment: Alignment.topRight,
                child:
                skip
                    ? InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.login);
                  },
                  child: Text(
                    'Skip',
                    style: AppTextStyle.instance.textStyle14
                        .copyWith(color: Colors.white),
                  ),
                )
                    : const Text(""),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(36, 36, 36, 0.5),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.instance.textStyle24.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          contain,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.instance.textStyle16.copyWith(
                            color: AppColors.neutral10,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _dot(isActive: activeDotState == 0),
                            _dot(isActive: activeDotState == 1),
                            _dot(isActive: activeDotState == 2),
                          ],
                        ),
                        const SizedBox(height: 20),
                        activeDotState == 0
                            ? ElevatedButton(
                              onPressed: onPressedElevated,
                              child: Text(
                                'Next',
                                style: AppTextStyle.instance.textStyle14
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            )
                            : Row(
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: onPressedOutLined,
                                    child: Text(
                                      'Back',
                                      style: AppTextStyle.instance.textStyle14
                                          .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                const Spacer(),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: onPressedElevated,
                                    child:
                                        activeDotState == 1
                                            ? Text(
                                              'Next',
                                              style: AppTextStyle
                                                  .instance
                                                  .textStyle14
                                                  .copyWith(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            )
                                            : Text(
                                              'Got It',
                                              style: AppTextStyle
                                                  .instance
                                                  .textStyle14
                                                  .copyWith(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
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
          ],
        ),
      ),
    );
  }

  Widget _dot({required bool isActive}) {
    return Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isActive ? AppColors.mainRed : Colors.white.withOpacity(0.3),
        shape: BoxShape.circle,
      ),
    );
  }
}
