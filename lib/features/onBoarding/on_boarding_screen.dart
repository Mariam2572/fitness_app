import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:fitness_app/features/onBoarding/onboarding_bottom_sheet.dart';
import 'package:fitness_app/features/onBoarding/onboarding_item.dart';
import 'package:flutter/material.dart';



class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<OnBoardingItem> _onBoardingItems = [
    OnBoardingItem(
      image: AppAssets.onBoardingOne,
      title: "the price of excellence \n is discipline",
      description:
          "Lorem ipsum dolor sit amet consectetur. Eu urna ut gravida quis id pretium purus. Mauris massa ",
      showSkip: true,
    ),
    OnBoardingItem(
      image: AppAssets.onBoardingTwo,
      title: "Fitness has never been so \n much fun",
      description:
          "Lorem ipsum dolor sit amet consectetur. Eu urna ut gravida quis id pretium purus. Mauris massa ",
      showSkip: true,
    ),
    OnBoardingItem(
      image: AppAssets.onBoardingThree,
      title: "NO MORE EXCUSES \n Do It Now",
      description:
          "Lorem ipsum dolor sit amet consectetur. Eu urna ut gravida quis id pretium purus. Mauris massa ",
      showSkip: false,
    ),
  ];

  void _nextPage() {
    if (_currentIndex < _onBoardingItems.length - 1) {
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

  void _skip() {
    Navigator.pushReplacementNamed(context, RoutesName.login);
  }

  @override
  Widget build(BuildContext context) {
    final currentItem = _onBoardingItems[_currentIndex];
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(AppAssets.onBoardingBackGround, fit: BoxFit.cover),
            PageView.builder(
              controller: _pageController,
              itemCount: _onBoardingItems.length,
              onPageChanged: (index) => setState(() => _currentIndex = index),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: Image.asset(
                  _onBoardingItems[index].image,
                  fit: BoxFit.contain,
                  height: double.infinity,
                ),
              ),
            ),
            if (currentItem.showSkip)
              Positioned(
                top: 40,
                right: 17,
                child: InkWell(
                  onTap: _skip,
                  child: Text(
                    'Skip',
                    style: AppTextStyle.instance.textStyle14.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            OnBoardingBottomSheet(
              item: currentItem,
              currentIndex: _currentIndex,
              total: _onBoardingItems.length,
              onNext: _nextPage,
              onBack: _prevPage,
            ),
          ],
        ),
      ),
    );
  }
}


