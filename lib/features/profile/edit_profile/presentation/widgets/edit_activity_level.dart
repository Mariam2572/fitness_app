import 'package:fitness_app/core/utils/enums/activity_enum.dart';
import 'package:fitness_app/features/auth/register/presentation/custom/custom_activity_screen.dart';
import 'package:fitness_app/features/profile/edit_profile/presentation/view_model/cubit/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditActivityLevel extends StatelessWidget {
  const EditActivityLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomActivtiesScreen(
      isEditProfile: true,
      initialActivity: stringToActivityEnum(
        context.read<EditProfileCubit>().activityLevel,
      ),
      onChanged: (val) async {
        final editProfileCubit = context.read<EditProfileCubit>();
        editProfileCubit.activityLevel = val;
        editProfileCubit.doIntent(
          EditProfileInfoIntent(
            editProfileRequest: editProfileCubit.currentEditProfileRequest,
          ),
        );
        Navigator.pop(context);
        editProfileCubit.doIntent(GetLoggedUserDataIntent());
      },
    );
  }
}
