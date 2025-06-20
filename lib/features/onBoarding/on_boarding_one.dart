import 'dart:ui';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, dynamic>> onBoardingData = [
    {
      'image': AppAssets.onBoardingOne,
      'title': "the price of excellence \n is discipline",
      'contain':
          "Lorem ipsum dolor sit amet consectetur. Eu urna ut gravida quis id pretium purus. Mauris massa ",
      'skip': true,
    },
    {
      'image': AppAssets.onBoardingTwo,
      'title': "Fitness has never been so \n much fun",
      'contain':
          "Lorem ipsum dolor sit amet consectetur. Eu urna ut gravida quis id pretium purus. Mauris massa ",
      'skip': true,
    },
    {
      'image': AppAssets.onBoardingThree,
      'title': "NO MORE EXCUSES \n Do It Now",
      'contain':
          "Lorem ipsum dolor sit amet consectetur. Eu urna ut gravida quis id pretium purus. Mauris massa ",
      'skip': false,
    },
  ];

  void _nextPage() {
    if (_currentIndex < onBoardingData.length - 1) {
      _pageController.animateToPage(
        _currentIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      Navigator.pushReplacementNamed(context, RoutesName.login);
    }
  }

  void _prevPage() {
    if (_currentIndex > 0) {
      _pageController.animateToPage(
        _currentIndex - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(AppAssets.onBoardingBackGround, fit: BoxFit.cover),
            PageView.builder(
              controller: _pageController,
              itemCount: onBoardingData.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final data = onBoardingData[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: Image.asset(
                    data['image'],
                    fit: BoxFit.contain,
                    height: double.infinity,
                  ),
                );
              },
            ),
            if (onBoardingData[_currentIndex]['skip'])
              Padding(
                padding: const EdgeInsets.only(top: 40, right: 17),
                child: Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap:
                        () => Navigator.pushReplacementNamed(
                          context,
                          RoutesName.login,
                        ),
                    child: Text(
                      'Skip',
                      style: AppTextStyle.instance.textStyle14.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            onBoardingData[_currentIndex]['title'],
                            textAlign: TextAlign.center,
                            style: AppTextStyle.instance.textStyle24.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            onBoardingData[_currentIndex]['contain'],
                            textAlign: TextAlign.center,
                            style: AppTextStyle.instance.textStyle16.copyWith(
                              color: AppColors.neutral10,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              onBoardingData.length,
                              (i) => _dot(isActive: i == _currentIndex),
                            ),
                          ),
                          const SizedBox(height: 20),
                          _currentIndex == 0
                              ? ElevatedButton(
                                onPressed: _nextPage,
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
                                      onPressed: _prevPage,
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
                                      onPressed: _nextPage,
                                      child: Text(
                                        _currentIndex ==
                                                onBoardingData.length - 1
                                            ? 'Got It'
                                            : 'Next',
                                        style: AppTextStyle.instance.textStyle14
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
