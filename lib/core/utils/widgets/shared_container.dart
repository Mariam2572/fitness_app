// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SharedContainer extends StatelessWidget {
final  List<Widget> children;
final double? height;
  const SharedContainer({super.key, required this.children, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      width: double.infinity,
      height: height ?? context.height * 0.7,
      decoration: BoxDecoration(
        color: AppColors.neutral90.withValues(alpha: .01),
        borderRadius: BorderRadius.circular(25.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 22.6, sigmaY: 22.6),
        child: SingleChildScrollView(child: Column(children: children)),
      ),
    );
  }
}
