import 'package:flutter/material.dart';

extension MediaQueryHelper on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}

extension PaddingHelper on BuildContext {
  EdgeInsets get padding => MediaQuery.of(this).padding;
}

extension OrientationHelper on BuildContext {
  Orientation get orientation => MediaQuery.of(this).orientation;
}

extension TextScaleFactorHelper on BuildContext {
  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;
}

extension ViewInsetsHelper on BuildContext {
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;
}

extension TextThemeHelper on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}
