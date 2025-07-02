import 'dart:io';

import 'package:fitness_app/core/utils/helper_func/snack_bar.dart';
import 'package:fitness_app/core/utils/theme/app_assets.dart';
import 'package:fitness_app/core/utils/theme/app_colors.dart';
import 'package:fitness_app/features/profile/edit_profile/data/models/response/get_user_data_reponse.dart';
import 'package:fitness_app/features/profile/edit_profile/presentation/view_model/cubit/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePhotoWidget extends StatefulWidget {
  final GetUserDataReponse userData;

  const ProfilePhotoWidget({super.key,required this.userData});

  @override
  State<ProfilePhotoWidget> createState() => _ProfilePhotoWidgetState();
}

class _ProfilePhotoWidgetState extends State<ProfilePhotoWidget> {
  File ?selectedImage;
  @override
  Widget build(BuildContext context) {
    final editProfileCubit= context.read<EditProfileCubit>();
    return                     Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage:
            selectedImage != null
                ? FileImage(selectedImage!)
                : (widget.userData.user?.photo != null
                ? NetworkImage(widget.userData.user?.photo
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
                  onPressed: () async {
                    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
                    if (picked != null) {
                      setState(() {
                        selectedImage = File(picked.path);
                      });
                      showSnackBar(context, "Uploading...");
                      editProfileCubit.doIntent(UploadPhotoIntent(photo: selectedImage!));
                    } else {
                      showErrorSnackBar(context, "Photo selection canceled.");
                    }
                  }


              ),
            ),
          ),
        ],
      ),
    );
  }

}
