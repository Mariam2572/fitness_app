import 'package:flutter/material.dart';

/// Reusable error state widget for sections
class ErrorStateWidget extends StatelessWidget {
  final String message;
  final TextStyle? textStyle;
  final double? height;

  const ErrorStateWidget({
    super.key,
    required this.message,
    this.textStyle,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final content = Center(
      child: Text(
        message,
        style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
    );

    if (height != null) {
      return SizedBox(height: height, child: content);
    }

    return content;
  }
}
