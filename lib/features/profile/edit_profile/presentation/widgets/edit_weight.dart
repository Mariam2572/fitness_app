import 'package:fitness_app/features/auth/register/presentation/custom/custom_weight_screen.dart';
import 'package:fitness_app/features/auth/register/presentation/screens/widgets/complete_registeration_app_bar_and_background_widget.dart';
import 'package:fitness_app/features/profile/edit_profile/data/models/request/edit_profile_request.dart';
import 'package:fitness_app/features/profile/edit_profile/presentation/view_model/cubit/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditWeight extends StatelessWidget {
  const EditWeight({super.key});

  @override
  Widget build(BuildContext context) {
    return CompleteRegisterationAppBarAndBackgroundSection(
      body: CustomWeightScreen(
        isEditProfile: true,
        initialValue: context.read<EditProfileCubit>().weight, // Replace with the actual initial value if needed
        onChanged: (val) {
        context.read<EditProfileCubit>().weight = val;
        
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