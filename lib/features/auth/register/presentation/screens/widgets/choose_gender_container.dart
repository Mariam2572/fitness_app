// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fitness_app/core/utils/enums/gender.dart';
import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/helper_func/snack_bar.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/widgets/custom_glass_container.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/widgets/gender_widget.dart';
import 'package:fitness_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart';

class ChooseGenderContainer extends StatefulWidget {
  final String? selectedGender;
  final bool isEditProfile;
  final Function(Gender gender)? onTap;
  const ChooseGenderContainer({
    super.key,
     this.selectedGender,
    this.isEditProfile = false,
    this.onTap,
  });

  @override
  State<ChooseGenderContainer> createState() => _ChooseGenderContainerState();
}

class _ChooseGenderContainerState extends State<ChooseGenderContainer> {
    late String? selectedGender;
@override
  void initState() {
    selectedGender = widget.selectedGender;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    onGenderSelected(Gender gender) {
      setState(() {
        selectedGender = gender.name;
      });
      widget.onTap?.call(gender);
    }
    return CustomGlassContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          spacing: 24,
          children: [
            GenderWidget(
              image: AppAssets.maleIcon,
              title: context.loc.male,

              isSelected: selectedGender == Gender.male.name,
              onTap:()=> onGenderSelected(Gender.male),
            ),
            GenderWidget(
              image: AppAssets.femaleIcon,
              title: context.loc.female,

              isSelected: selectedGender == Gender.female.name,
              onTap:()=> onGenderSelected(Gender.female)
              
            ),
            if(!widget.isEditProfile) 
              // const SizedBox(),
                Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      selectedGender == null ? Colors.grey : AppColors.mainRed,
                ),
                onPressed: () {
                  if (selectedGender != null) {
                    Navigator.pushNamed(
                      context,
                      RoutesName.chooseAgeScreen,
                      arguments:   context.read<RegisterCubit>(),
                                        );
                  } else {
                    showSnackBar(context, context.loc.pleaseSelectYourGender);
                  }
                },
                child: Text(
                  context.loc.next,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.baseWhite,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
