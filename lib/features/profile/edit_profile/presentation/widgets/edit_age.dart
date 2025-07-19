import 'package:fitness_app/features/auth/register/presentation/custom/custom_age.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/widgets/complete_registeration_app_bar_and_background_widget.dart';
import 'package:fitness_app/features/profile/edit_profile/presentation/view_model/cubit/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditAge extends StatelessWidget {
  const EditAge({super.key});

  @override
  Widget build(BuildContext context) {
    return CompleteRegisterationAppBarAndBackgroundSection(
      body: CustomAge(
        isEditProfile: true,
        initialValue: context.read<EditProfileCubit>().age,

        onChanged: (val) async {
          context.read<EditProfileCubit>().age = val;
        },
        onPressed: () {
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
    );
  }
}
