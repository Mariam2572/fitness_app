import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/core/utils/enums/activity_enum.dart';
import 'package:fitness_app/core/utils/enums/gender.dart';
import 'package:fitness_app/features/profile/edit_profile/data/models/request/edit_profile_request.dart';
import 'package:fitness_app/features/profile/edit_profile/data/models/response/get_user_data_reponse.dart';
import 'package:fitness_app/features/profile/edit_profile/data/models/response/upload_photo_response.dart';
import 'package:fitness_app/features/profile/edit_profile/domain/use_cases/edit_profile_use_case.dart';
import 'package:fitness_app/features/profile/edit_profile/domain/use_cases/get_logged_user_data_use_case.dart';
import 'package:fitness_app/features/profile/edit_profile/domain/use_cases/upload_photo_use_case.dart';
import 'package:flutter/material.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final EditProfileUseCase _editProfileUseCase;
  final GetLoggedUserDataUseCase _getLoggedUserDataUseCase;
  final UploadPhotoUseCase _uploadPhotoUseCase;

  EditProfileCubit(this._editProfileUseCase,this._getLoggedUserDataUseCase,this._uploadPhotoUseCase) : super(GetProfileInitial());

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  int height = 0;
  int weight = 40;
  int age = 19;
  String? goal;
  ActivityEnum? activityLevel;
   Gender selectedGender = Gender.female;
  bool isEdited=false;
  bool isEditProfile=false;
  File? selectedImage;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void doIntent(EditProfileIntent intent) {
    switch (intent) {
      case GetLoggedUserDataIntent():
        _getProfile();
        break;
      case EditProfileInfoIntent():
        _editProfile(intent);
        break;
      case UploadPhotoIntent():
        _uploadPohot(intent);
        break;
    }
  }

  Future<void> _getProfile() async {
    emit(GetProfileLoading());
    final response = await _getLoggedUserDataUseCase.invoke();
    switch (response) {
      case ApiError<GetUserDataReponse>():
        emit(
          GetProfileFailure(
            response.failure?.errorMessage ?? 'An error occurred',          ),
        );
      case ApiSuccess<GetUserDataReponse>():{
        firstNameController.text=response.data?.user?.firstName??"";
        lastNameController.text=response.data?.user?.lastName??"";
        emailController.text=response.data?.user?.email??"";
        height=response.data?.user?.height??0;
        weight=response.data?.user?.weight??0;
        age=response.data?.user?.age??0;
        goal=response.data?.user?.goal??"";


        final activity = response.data?.user?.activityLevel;

        if (activity == "level1") {
          activityLevel = ActivityEnum.level1;
        } else if (activity == "level2") {
          activityLevel = ActivityEnum.level2;
        } else if (activity == "level3") {
          activityLevel = ActivityEnum.level3;
        } else if (activity == "level4") {
          activityLevel = ActivityEnum.level4;
        } else if (activity == "level5") {
          activityLevel = ActivityEnum.level5;
        } else {
          activityLevel = ActivityEnum.level1; // fallback
        }

        selectedGender=response.data?.user?.gender=="male"?Gender.male:Gender.female;
        emit(GetProfileSuccess(response.data!));
      }
      }

  }
  Future<void> _editProfile(EditProfileInfoIntent intent) async {
    emit(EditProfileLoading());
    final response = await _editProfileUseCase.invoke(intent.editProfileRequest);
    switch (response) {
      case ApiError<GetUserDataReponse>():
        emit(
          EditProfileFailure(
            response.failure?.errorMessage ?? 'An error occurred',
          ),
        );
      case ApiSuccess<GetUserDataReponse>():
        emit(EditProfileSuccess(response.data!));
    }
  }
  Future<void> _uploadPohot(UploadPhotoIntent intent) async {

    emit(EditProfileLoading());
    final response = await _uploadPhotoUseCase.invoke(intent.photo);
    switch (response) {
      case ApiError<String>():{
        emit(
          EditProfileFailure(
            response.failure?.errorMessage ?? 'An error occurred',
          ),
        );
       }
      case ApiSuccess<String>():{
        emit(EditProfileSuccess(response.data));
       }
    }

  }

}

sealed class EditProfileIntent {}

class GetLoggedUserDataIntent extends EditProfileIntent {

}
class EditProfileInfoIntent extends EditProfileIntent {
  EditProfileRequest editProfileRequest;
  EditProfileInfoIntent({required this.editProfileRequest});
}
class UploadPhotoIntent extends EditProfileIntent {
  File photo;
  UploadPhotoIntent({required this.photo});
}
