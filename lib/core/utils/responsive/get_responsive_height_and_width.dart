import 'package:fitness_app/core/utils/responsive/screen_size_service.dart';
import 'package:flutter/widgets.dart';

SizedBox responsiveHeightWidget(double height) =>
    SizedBox(height: responsiveHeight(height));
SizedBox responsiveWidthWidget(double width) =>
    SizedBox(width: responsiveHeight(width));
double responsiveHeight(double height) {
  final screenHeight = ScreenSizeService.height;
  return (height / ScreenSizeService.baseHeight) * screenHeight;
}

double responsiveWidth(double width) {
  final screenWidth = ScreenSizeService.width;
  return (width / ScreenSizeService.baseWidth) * screenWidth;
}
