// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/home/home/data/models/UserResponse.dart';
import 'package:fitness_app/features/logout/domain/usecases/logout_usecase.dart';
import 'package:fitness_app/features/profile/domain/use_case/get_profile_data.dart';
import 'package:fitness_app/features/profile/domain/use_case/upload_photo__use_case.dart';
import 'package:fitness_app/features/profile/presentation/view_model/profile_states.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileData getProfileData;
  final UploadPhoto uploadPhoto;
  final LogoutUseCase _logoutUseCase;
  ProfileCubit(this.getProfileData, this.uploadPhoto, this._logoutUseCase)
    : super(ProfileInitial());

  Future<void> doIntent(ProfileIntent intent) async {
    switch (intent) {
      case LoadProfileIntent():
        await _loadProfile();
        break;
      case UploadPhotoIntent(:final photo):
        await _uploadPhoto(photo);
        break;
      case LogoutIntent():
        await _logout();
        break;
    }
  }

  Future<void> _loadProfile() async {
    emit(ProfileLoading());
    final result = await getProfileData();
    switch (result) {
      case ApiSuccess<UserResponse>():
        emit(ProfileSuccess(user: result.data!));
        break;
      case ApiError<UserResponse>():
        emit(ProfileError(message: result.failure.toString()));
        break;
    }
  }

  Future<void> _uploadPhoto(File photo) async {
    emit(ProfileUploading());
    final result = await uploadPhoto(photo);
    switch (result) {
      case ApiSuccess<String>():
        log('Photo uploaded: ${result.data}');
        await _loadProfile(); // Reload profile after upload
        break;
      case ApiError<String>():
        emit(ProfileError(message: result.failure.toString()));
        break;
    }
  }

  _logout() async {
    emit(ProfileLoading());
    final response = await _logoutUseCase();
    switch (response) {
      case ApiError<String>():
        emit(
          ProfileError(
            message: response.failure?.errorMessage ?? 'An error occurred',
          ),
        );
      case ApiSuccess<String>():
        emit(ProfileSuccess(message: response.data!));
      default:
        break;
    }
  }
}

abstract class ProfileIntent {}

class LoadProfileIntent extends ProfileIntent {}

class UploadPhotoIntent extends ProfileIntent {
  final File photo;
  UploadPhotoIntent(this.photo);
}
class LogoutIntent extends ProfileIntent {}