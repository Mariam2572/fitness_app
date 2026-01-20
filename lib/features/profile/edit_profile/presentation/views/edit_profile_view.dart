import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/features/profile/edit_profile/domain/use_cases/edit_profile_use_case.dart';
import 'package:fitness_app/features/profile/edit_profile/domain/use_cases/get_logged_user_data_use_case.dart';
import 'package:fitness_app/features/profile/edit_profile/domain/use_cases/upload_photo_use_case.dart';
import 'package:fitness_app/features/profile/edit_profile/presentation/view_model/cubit/edit_profile_cubit.dart';
import 'package:fitness_app/features/profile/edit_profile/presentation/views/edit_profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => EditProfileCubit(
            getIt<EditProfileUseCase>(),
            getIt<GetLoggedUserDataUseCase>(),
            getIt<UploadPhotoUseCase>(),
          ),
      child: const EditProfileViewBody(),
    );
  }
}
