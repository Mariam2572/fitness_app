

import 'package:flutter/material.dart';


  void setupAnimationBasedOnLocal({required BuildContext context , required AnimationController animationController , required Offset offset , required Animation<Offset> slidingAnimation}) {
     final local = Localizations.localeOf(context);
    final newOffset = local.languageCode == "ar" ? Offset(-1, 0) : Offset(1, 0);
    if (newOffset != offset) {
     
        offset = newOffset;
        slidingAnimation = Tween<Offset>(
          begin: offset,
          end: Offset.zero,
        ).animate(animationController);
    
      animationController.forward();
    }
  }