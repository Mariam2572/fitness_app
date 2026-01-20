import 'package:fitness_app/core/animation/animated_widgets.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/widgets/build_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CompleteRegisterationAppBarAndBackgroundSection extends StatelessWidget {
  const CompleteRegisterationAppBarAndBackgroundSection({
    super.key,
    required this.body,
  });
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(AppAssets.authBackGround, fit: BoxFit.fill),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: buildAppBar(
            leading: SvgPicture.asset(AppAssets.backIcon),
            title: Image.asset(AppAssets.logo, fit: BoxFit.fill),
            context: context,
          ),
          body: AnimatedSlideInWidget(child: body),
        ),
      ],
    );
  }
}
