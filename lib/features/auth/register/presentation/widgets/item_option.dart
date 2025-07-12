import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class OptionItem<T> extends StatelessWidget {
  final String label;
  final T value;
  final T? selectedValue;
  final ValueChanged<T?> onChanged;

  const OptionItem({
    super.key,
    required this.label,
    required this.value,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromRGBO(211, 211, 211, 0.2),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyle.instance.textStyle14.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          Radio<T>(
            value: value,
            groupValue: selectedValue,
            activeColor: const Color.fromRGBO(211, 211, 211, 1),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
