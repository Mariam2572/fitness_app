import 'dart:ui';

import 'package:fitness_app/core/utils/enums/gender.dart';
import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/helper_func/snack_bar.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/widgets/custom_glass_container.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/choose_age_screen.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/widgets/choose_age_screen_body.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/widgets/gender_widget.dart';
import 'package:fitness_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseGenderContainer extends StatefulWidget {
  const ChooseGenderContainer({super.key});

  @override
  State<ChooseGenderContainer> createState() => _ChooseGenderContainerState();
}

class _ChooseGenderContainerState extends State<ChooseGenderContainer> {
  String? selectedGender;
  @override
  Widget build(BuildContext context) {
  
    return CustomGlassContainer(child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              spacing: 24,
              children: [
                GenderWidget(
                  image: AppAssets.maleIcon,
                  title: context.loc.male,
                
                   isSelected: selectedGender == Gender.male.name,
                  onTap: () {
                    selectedGender = Gender.male.name;
                   RegisterCubit.selectedGender = Gender.male;
                  //  print("--------------------${RegisterCubit.selectedGender}");
                    setState(() {});
                  },
                ),
                GenderWidget(
                  image: AppAssets.femaleIcon,
                  title: context.loc.female,
                  
                  isSelected: selectedGender == Gender.female.name,
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female.name;
                      RegisterCubit.selectedGender = Gender.female;
                      print("--------------------${RegisterCubit.selectedGender}");
                      setState(() {});
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          selectedGender == null
                              ? Colors.grey
                              : AppColors.mainRed,
                    ),
                    onPressed: () {
                     if (selectedGender != null) {
                        Navigator.pushNamed(context, RoutesName.chooseAgeScreen);
                      }else {
                        showSnackBar(context, context.loc.pleaseSelectYourGender);
                      }
                    },
                    child: Text(
                      context.loc.next,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.baseWhite,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),);
  }
}
