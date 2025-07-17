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

class EditProfileCubit extends Cubit<ProfileState> {
  final EditProfileUseCase _editProfileUseCase;
  final GetLoggedUserDataUseCase _getLoggedUserDataUseCase;
  final UploadPhotoUseCase _uploadPhotoUseCase;

  EditProfileCubit(this._editProfileUseCase,this._getLoggedUserDataUseCase,this._uploadPhotoUseCase) : super(ProfileInitial());

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  int height = 0;
  int weight = 40;
  int age = 19;
  String? goal;
  String? activityLevel;
static  Gender selectedGender = Gender.female;
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
    emit(ProfileLoading());
    final response = await _getLoggedUserDataUseCase.invoke();
    switch (response) {
      case ApiError<GetUserDataReponse>():
        emit(
          ProfileFailure(
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
        activityLevel = response.data?.user?.activityLevel;
   
        selectedGender=response.data?.user?.gender=="male"?Gender.male:Gender.female;
        emit(ProfileSuccess(response.data!));
      }
      }

  }EditProfileRequest get currentEditProfileRequest {
  return EditProfileRequest(
    email: emailController.text,
    height: height,
    activityLevel: activityEnumToBackend(stringToActivityEnum(activityLevel)) ?? "level1", // fallback
    age: age,
    firstName: firstNameController.text,
    gender: EditProfileCubit.selectedGender.name,
    goal: goal,
    lastName: lastNameController.text,
    weight: weight,
  );
}

  Future<void> _editProfile(EditProfileInfoIntent intent) async {
    emit(ProfileLoading());
    final response = await _editProfileUseCase.invoke(intent.editProfileRequest);
    switch (response) {
      case ApiError<GetUserDataReponse>():
        emit(
          ProfileFailure(
            response.failure?.errorMessage ?? 'An error occurred',
          ),
        );
      case ApiSuccess<GetUserDataReponse>():
        emit(ProfileSuccess(response.data!));
    }
// _Profile();
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
