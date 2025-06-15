import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:flutter/material.dart';

SizedBox responsiveHeight(BuildContext context , double height) {
  return SizedBox(
    height:context.height * height,
  );
}
SizedBox sizedBoxWidth(BuildContext context , double width) {
  return SizedBox(
    width: context.width * width,
  );
}