import 'package:flutter/material.dart';
import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:flutter_svg/svg.dart';

class AuthAppBar extends StatelessWidget {
  final String title;

  const AuthAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.width;
    final screenHeight = context.height;

    return Padding(
      padding: EdgeInsets.only(
        top: context.padding.top + 15,
        bottom: screenHeight * 0.03,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(
              AppAssets.backIcon,
              width: screenWidth * 0.06,
            ),
          ),
          SizedBox(width: screenWidth * 0.07),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: screenWidth * 0.055,
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
