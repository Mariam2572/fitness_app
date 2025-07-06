import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UpcomingWorkoutsCategory extends StatefulWidget {
  final List<String> bodyParts;
  final bool isLoading;

  const UpcomingWorkoutsCategory({
    Key? key,
    required this.bodyParts,
    required this.isLoading,
  }) : super(key: key);

  @override
  State<UpcomingWorkoutsCategory> createState() =>
      _BodyPartsFilterWidgetState();
}

class _BodyPartsFilterWidgetState extends State<UpcomingWorkoutsCategory> {
  late String selectedBodyPart;

  @override
  void initState() {
    super.initState();
    selectedBodyPart = widget.bodyParts[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(2),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,

        child: Row(
          children:
              widget.bodyParts.map((bodyPart) {
                final isSelected = selectedBodyPart == bodyPart;

                return Padding(
                  padding: REdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedBodyPart = bodyPart;
                      });
                    },
                    child: Container(
                      padding: REdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color:
                            isSelected && !widget.isLoading ? AppColors.mainRed : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        bodyPart,
                        style: AppTextStyle.instance.textStyle16.copyWith(
                          color:
                              isSelected ? Colors.white : AppColors.neutral10,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
