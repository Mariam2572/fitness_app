import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/base/api_result.dart';
import 'package:fitness_app/features/profile/edit_profile/data/models/request/edit_profile_request.dart';
import 'package:fitness_app/features/profile/edit_profile/data/models/response/get_user_data_reponse.dart';
import 'package:fitness_app/features/profile/edit_profile/domain/use_cases/edit_profile_use_case.dart';
import 'package:fitness_app/features/profile/edit_profile/domain/use_cases/get_logged_user_data_use_case.dart';
import 'package:fitness_app/features/profile/edit_profile/domain/use_cases/upload_photo_use_case.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final EditProfileUseCase _editProfileUseCase;
  final GetLoggedUserDataUseCase _getLoggedUserDataUseCase;
  final UploadPhotoUseCase _uploadPhotoUseCase;

  EditProfileCubit(this._editProfileUseCase,this._getLoggedUserDataUseCase,this._uploadPhotoUseCase) : super(GetProfileInitial());
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
    emit(UploadPhotoLoading());
    final response = await _uploadPhotoUseCase.invoke(intent.photo);
    switch (response) {
      case ApiError<String>():
        emit(
          UploadPhotoFailure(
            response.failure?.errorMessage ?? 'An error occurred',
          ),
        );
      case ApiSuccess<String>():
        emit(UploadPhotoSuccess(response.data!));
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
