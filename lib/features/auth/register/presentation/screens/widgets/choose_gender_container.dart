import 'dart:ui';

import 'package:fitness_app/core/utils/enums/gender.dart';
import 'package:fitness_app/core/utils/helper_func/snack_bar.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/widgets/gender_widget.dart';
import 'package:fitness_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ChooseGenderContainer extends StatefulWidget {
  const ChooseGenderContainer({
    super.key,
  });

  @override
  State<ChooseGenderContainer> createState() => _ChooseGenderContainerState();
}

class _ChooseGenderContainerState extends State<ChooseGenderContainer> {
    String? selectedGender;
  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!; 
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 34.6, sigmaY: 34.6),
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.45,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              spacing: 24,
              children: [
                GenderWidget(
                  image: 'assets/images/male_icon.png',
                  title: localization.male,
                
                   isSelected: selectedGender == Gender.male.name,
                  onTap: () {
                    selectedGender = Gender.male.name;
                    setState(() {});
                  },
                ),
                GenderWidget(
                  image: 'assets/images/female_icon.png',
                  title: localization.female,
                  
                  isSelected: selectedGender == Gender.female.name,
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female.name;
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
                        Navigator.pushNamed(
                          context,
                          RoutesName.chooseAgeScreen,
                        ); 
                      }else {
                        showSnackBar(context, localization.pleaseSelectYourGender);
                      }
                    },
                    child: Text(
                      localization.next,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
