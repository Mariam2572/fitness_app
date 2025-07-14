import 'package:fitness_app/features/auth/register/presentation/custom/custom_height_screen.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/widgets/complete_registeration_app_bar_and_background_widget.dart';
import 'package:fitness_app/features/profile/edit_profile/presentation/view_model/cubit/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditHeigth extends StatelessWidget {
  const EditHeigth({super.key});

  @override
  Widget build(BuildContext context) {
    return CompleteRegisterationAppBarAndBackgroundSection(
      body: CustomHeightScreen(
        isEditProfile: true,
        initialValue: context.read<EditProfileCubit>().height,
        onChanged: (val) {
          context.read<EditProfileCubit>().height = val;
        },
        onPressed: () {
          final editProfileCubit = context.read<EditProfileCubit>();

          editProfileCubit.doIntent(
            EditProfileInfoIntent(
              editProfileRequest: editProfileCubit.currentEditProfileRequest,
            ),
          );
          Navigator.pop(context);
          editProfileCubit.doIntent(GetLoggedUserDataIntent());
        },
      ),
    );
  }
}
