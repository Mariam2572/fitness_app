import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class NumberPickerWidget extends StatefulWidget {
  const NumberPickerWidget({
    super.key,
    required this.minValue,
    required this.maxValue,
    required this.initialValue,
    required this.onChanged,
  });
  final int minValue;
  final int maxValue;
  final int initialValue;
  final void Function(int) onChanged;
  @override
  State<NumberPickerWidget> createState() => _NumberPickerWidgetState();
}

class _NumberPickerWidgetState extends State<NumberPickerWidget> {
  late int currentValue;
  @override
  void initState() {
    currentValue = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NumberPicker(
         
          textStyle: context.textTheme.displayLarge?.copyWith(
            color: AppColors.white,
            fontSize: 33,
            fontWeight: FontWeight.w800,
          ),
          selectedTextStyle: context.textTheme.headlineLarge?.copyWith(
            color: AppColors.mainRed,
            fontWeight: FontWeight.w800,
          ),
          axis: Axis.horizontal,
          value: currentValue,
          minValue: widget.minValue,
          maxValue: widget.maxValue,

          onChanged: (value) {
            currentValue = value;
            widget.onChanged(value);
            setState(() {});
          },
        ),
      ],
    );
  }
}
