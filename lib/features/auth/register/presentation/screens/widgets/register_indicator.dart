import 'package:flutter/material.dart';

class ProgressCircleIndicator extends StatelessWidget {
  final String label;
  final double value;
  final double angle;
  final Color progressColor;
  final TextStyle textStyle;

  const ProgressCircleIndicator({
    super.key,
    required this.label,
    required this.value,
    required this.angle,
    required this.progressColor,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.rotate(
            angle: angle,
            child: SizedBox(
              height: 60,
              width: 60,
              child: CircularProgressIndicator(
                value: value,
                strokeWidth: 6,
                valueColor: AlwaysStoppedAnimation(progressColor),
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
          Text(label, style: textStyle),
        ],
      ),
    );
  }
}
