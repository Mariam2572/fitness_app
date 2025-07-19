import 'dart:io';

import 'package:fitness_app/core/utils/helper_func/snack_bar.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/profile/edit_profile/data/models/response/get_user_data_reponse.dart';
import 'package:fitness_app/features/profile/edit_profile/presentation/view_model/cubit/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePhotoWidget extends StatelessWidget {

  const ProfilePhotoWidget({super.key});

  Future<void> pickImage(EditProfileCubit editProfile) async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      editProfile.selectedImage = File(picked.path);
      editProfile.doIntent(UploadPhotoIntent(photo: editProfile.selectedImage!));
      // editProfile.doIntent(GetLoggedUserDataIntent());

    } else {
      editProfile.selectedImage = File(editProfile.profilePhoto ?? '');
    }
  }
  @override
  Widget build(BuildContext context) {

    final editProfileCubit= context.read<EditProfileCubit>();
    return                     Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage:
            editProfileCubit.selectedImage != null
                ? FileImage(editProfileCubit.selectedImage!)
                : (editProfileCubit.profilePhoto != null
                ? NetworkImage(editProfileCubit.profilePhoto
                ?? '')
                : const AssetImage(AppAssets.profile))
            as ImageProvider,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 24,
              height: 24,
              decoration:  const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),

                color: AppColors.mainRed,
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.black,
                  size: 14,
                ),
                  onPressed:() {
                    pickImage(editProfileCubit);


                  },


              ),
            ),
          ),
        ],
      ),
    );
  }}
