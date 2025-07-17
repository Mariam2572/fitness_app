import 'package:fitness_app/core/utils/enums/gender.dart';
import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/helper_func/snack_bar.dart';
import 'package:fitness_app/core/utils/routes/routes_name.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/widgets/custom_glass_container.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/widgets/gender_widget.dart';
import 'package:fitness_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart';
import 'package:fitness_app/features/profile/edit_profile/presentation/view_model/cubit/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseGenderContainer extends StatefulWidget {
  const ChooseGenderContainer({super.key});

  @override
  State<ChooseGenderContainer> createState() => _ChooseGenderContainerState();
}

class _ChooseGenderContainerState extends State<ChooseGenderContainer> {

  @override
  Widget build(BuildContext context) {
    String? selectedGender=
        context.read<EditProfileCubit?>()?.selectedGender.name
    ;
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
              onTap: () {
                selectedGender = Gender.male.name;
                RegisterCubit.selectedGender = Gender.male;
                context.read<EditProfileCubit>().selectedGender=Gender.male;

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
                  context.read<EditProfileCubit>().selectedGender=Gender.female;

                  print("--------------------${RegisterCubit.selectedGender}");
                  setState(() {});
                });
              },
            ),
            context.read<EditProfileCubit>().isEditProfile?   SizedBox():  Padding(
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
                      arguments:   {
                        'registerCubit': context.read<RegisterCubit>(),
                      },                    );
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
