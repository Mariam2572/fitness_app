import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/widgets/choose_gender_container.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/widgets/circular_percent_indicator_widget.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/widgets/complete_registeration_app_bar_and_background_widget.dart';
import 'package:fitness_app/features/profile/edit_profile/data/models/request/edit_profile_request.dart';
import 'package:fitness_app/features/profile/edit_profile/presentation/view_model/cubit/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditGender extends StatelessWidget {
  
  const EditGender({super.key});

  @override
  Widget build(BuildContext context) {
    return CompleteRegisterationAppBarAndBackgroundSection(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 90),
          const CircularPercentIndicatorWidget(currentStep: 1, totalSteps: 6),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              context.loc.tellUsAboutYourSelf,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.baseWhite,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              context.loc.weNeedToKnowYourGender,
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(color: AppColors.baseWhite),
            ),
          ),
          const SizedBox(height: 16),
           ChooseGenderContainer(
             isEditProfile: true,
            //  selectedGender: context.read<EditProfileCubit>().selectedGender.name,
             onTap: (gender) {
               EditProfileCubit.selectedGender = gender;
               final editProfileCubit = context.read<EditProfileCubit>();
      
          editProfileCubit.doIntent(
              EditProfileInfoIntent(
                editProfileRequest: editProfileCubit.currentEditProfileRequest
              ),
            );
          Navigator.pop(context);
          editProfileCubit.doIntent(GetLoggedUserDataIntent());
             },
           ),
        ],
      ),
    );
  }
}
