import 'package:fitness_app/core/config/di.dart';
import 'package:fitness_app/features/logout/domain/usecases/logout_usecase.dart';
import 'package:fitness_app/features/profile/domain/use_case/get_profile_data_use_case.dart';
import 'package:fitness_app/features/profile/domain/use_case/upload_photo__use_case.dart';
import 'package:fitness_app/features/profile/presentation/view/profile_body.dart';
import 'package:fitness_app/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => ProfileCubit(
            getIt<GetProfileDataUseCase>(),
            getIt<UploadPhoto>(),
            getIt<LogoutUseCase>(),
          )..doIntent(LoadProfileIntent()),
      child: const ProfileBody(),
    );
  }
}

