import 'package:fitness_app/core/utils/helper/extention.dart';
import 'package:fitness_app/core/utils/helper/sized_box_helper.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/core/utils/validator.dart';
import 'package:fitness_app/features/auth/register/presentation/view_model/cubit/register_cubit.dart';
import 'package:fitness_app/features/profile/edit_profile/presentation/view_model/cubit/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileFieldsSection extends StatefulWidget {
  const EditProfileFieldsSection({super.key});

  @override
  State<EditProfileFieldsSection> createState() => _EditProfileFieldsSectionState();
}

class _EditProfileFieldsSectionState extends State<EditProfileFieldsSection> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    final editProfileCubit= context.read<EditProfileCubit>();
    return Form(
      key: editProfileCubit.formKey,
      child: Column(
        children: [
          TextFormField(
      
            onFieldSubmitted: (value) {
              editProfileCubit.firstNameController.text = value;
              editProfileCubit.doIntent(EditProfileInfoIntent(
                editProfileRequest: editProfileCubit.currentEditProfileRequest

              ));
              editProfileCubit.doIntent(GetLoggedUserDataIntent());
            },
            // onSaved: ,

            key: const ValueKey('editFirstNameField'),
            validator: (value) => Validator.validateName(value),
            controller: editProfileCubit.firstNameController,
            decoration: InputDecoration(
              labelText: context.loc.first_name,
              prefixIcon: Image.asset(
                AppAssets.user,
                color: AppColors.neutral5,
                width: 20,
                height: 15,
              ),
              prefixIconColor: AppColors.neutral5,
            ),
          ),
          responsiveHeight(context, 0.02),
          TextFormField(
            key: const ValueKey('editLastNameField'),
              onFieldSubmitted: (value) {
              editProfileCubit.lastNameController.text = value;
              editProfileCubit.doIntent(EditProfileInfoIntent(
                editProfileRequest: editProfileCubit.currentEditProfileRequest

              ));
              editProfileCubit.doIntent(GetLoggedUserDataIntent());
            },
            validator: (value) => Validator.validateName(value),
            controller: editProfileCubit.lastNameController,
            decoration: InputDecoration(
              labelText: context.loc.last_name,
              prefixIcon: Image.asset(
                AppAssets.user,
                color: AppColors.neutral5,
                width: 20,
                height: 15,
              ),
              prefixIconColor: AppColors.neutral5,
            ),
          ),
          responsiveHeight(context, 0.02),
          TextFormField(
            key: const ValueKey('editEmailField'),
              onFieldSubmitted: (value) {
              editProfileCubit.emailController.text = value;

              editProfileCubit.doIntent(EditProfileInfoIntent(
                editProfileRequest: editProfileCubit.currentEditProfileRequest

              ));
              editProfileCubit.doIntent(GetLoggedUserDataIntent());
            },
            validator: (value) => Validator.validateEmail(value),
            controller: editProfileCubit.emailController,
            decoration: InputDecoration(
              labelText: context.loc.email,
              prefixIcon: Image.asset(
                AppAssets.mail,
                color: AppColors.neutral5,
                width: 20,
                height: 15,
              ),
              prefixIconColor: AppColors.neutral5,
            ),
          ),

        ],
      ),
    );
  }
}
