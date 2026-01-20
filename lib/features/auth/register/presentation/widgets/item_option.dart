import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class OptionItem<T> extends StatelessWidget {
  final String label;
  final T value;
  const OptionItem({super.key, required this.label, required this.value});

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
            activeColor: const Color.fromRGBO(211, 211, 211, 1),
          ),
        ],
      ),
    );
  }
}
